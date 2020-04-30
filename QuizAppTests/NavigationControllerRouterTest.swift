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
//  func test_routeToQuestion_presentsQuestionController() {
//    let navigationController = UINavigationController()
//
//    let sut = NavigationControllerRouter(navigationController)
//    sut.routeTo(question: "Q1", answerCallback: { _ in })
//
//    XCTAssertEqual(navigationController.viewControllers.count, 1)
//  }
//
//  func test_routeToQuestionTwice_presentsQuestionControllerTwice() {
//    let navigationController = UINavigationController()
//
//    let sut = NavigationControllerRouter(navigationController)
//    sut.routeTo(question: "Q1", answerCallback: { _ in })
//    sut.routeTo(question: "Q2", answerCallback: { _ in })
//
//    XCTAssertEqual(navigationController.viewControllers.count, 2)
//  }
//
  func test_routeToQuestionTwice_presentsQuestionController() {
    let navigationController = UINavigationController()
    let factory = ViewControllerFactoryStub()
    let viewController = UIViewController()
    factory.stub(question: "Q1", with: viewController)
    let sut = NavigationControllerRouter(navigationController, factory: factory)
    sut.routeTo(question: "Q1", answerCallback: { _ in })
//    sut.routeTo(question: "Q2", answerCallback: { _ in })
    
    XCTAssertEqual(navigationController.viewControllers.first, viewController)
  }
  
  class ViewControllerFactoryStub: ViewControllerFactory {
    private var stubbedQuestions = [String: UIViewController]()
    
    func stub(question: String, with viewController: UIViewController) {
      stubbedQuestions[question] = viewController
    }
    func questionViewController(for question: String, answerCallback: (String) -> Void) -> UIViewController {
      return stubbedQuestions[question]!
    }
    
  }
  
}
