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
//  var sut: NavigationControllerRouter!
  lazy var sut: NavigationControllerRouter = { return NavigationControllerRouter(self.navigationController, factory: self.factory) }()
  
//  override func setUp() {
//    sut = NavigationControllerRouter(navigationController, factory: factory)
//  }
  
  func test_routesToQuestion_showsQuestionController() {
    let viewController = UIViewController()
    let secondViewController = UIViewController()
    factory.stub(question: "Q1", with: viewController)
    factory.stub(question: "Q2", with: secondViewController)
    
    sut.routeTo(question: "Q1", answerCallback: { _ in })
    sut.routeTo(question: "Q2", answerCallback: { _ in })
    
    XCTAssertEqual(navigationController.viewControllers.count, 2)
    XCTAssertEqual(navigationController.viewControllers.first, viewController)
    XCTAssertEqual(navigationController.viewControllers.last, secondViewController)
  }
  
  func test_routeToQuestion_presentsQuestionControllerWithRightCallback() {
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
      return stubbedQuestions[question] ?? UIViewController()
    }
    
  }
  
}
