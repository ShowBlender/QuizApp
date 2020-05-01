//
//  NavigationControllerRouterTest.swift
//  QuizAppTests
//
//  Created by Joseph McCraw on 4/30/20.
//  Copyright © 2020 Joseph McCraw. All rights reserved.
//
import UIKit
import XCTest
import QuizEngine
@testable import QuizApp

class NavigationControllerRouterTest: XCTestCase {
  let navigationController = UINavigationController()
  let factory = ViewControllerFactoryStub()
  
  func test_routesToQuestion_showsQuestionController() {
    let viewController = UIViewController()
    let secondViewController = UIViewController()
    factory.stub(question: "Q1", with: viewController)
    factory.stub(question: "Q2", with: secondViewController)
    let sut = NavigationControllerRouter(navigationController, factory: factory)
    
    sut.routeTo(question: "Q1", answerCallback: { _ in })
    sut.routeTo(question: "Q2", answerCallback: { _ in })
    
    XCTAssertEqual(navigationController.viewControllers.count, 2)
    XCTAssertEqual(navigationController.viewControllers.first, viewController)
    XCTAssertEqual(navigationController.viewControllers.last, secondViewController)
  }
  
  func test_routeToQuestion_presentsQuestionControllerWithRightCallback() {
    let viewController = UIViewController()
    factory.stub(question: "Q1", with: viewController)
    let sut = NavigationControllerRouter(navigationController, factory: factory)
    var callbackWasFired = false
    sut.routeTo(question: "Q1", answerCallback: { _ in callbackWasFired = true })
    factory.answerCallback["Q1"]!("anything")
    XCTAssertTrue(callbackWasFired)
  }
  
  class ViewControllerFactoryStub: ViewControllerFactory {
    private var stubbedQuestions = [String: UIViewController]()
    var answerCallback = [String: (String) -> Void]()
    
    func stub(question: String, with viewController: UIViewController) {
      stubbedQuestions[question] = viewController
    }
    func questionViewController(for question: String, answerCallback: @escaping (String) -> Void) -> UIViewController {
      self.answerCallback[question] = answerCallback
      return stubbedQuestions[question]!
    }
    
  }
  
}
