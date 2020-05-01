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
  let navigationController = NonAnimatedNavigationController()
  let factory = ViewControllerFactoryStub()
  
  lazy var sut: NavigationControllerRouter = { return NavigationControllerRouter(self.navigationController, factory: self.factory) }()
  
  func test_routesToQuestion_showsQuestionController() {
    let viewController = UIViewController()
    let secondViewController = UIViewController()
    factory.stub(question: Question.singleAnswer("Q1"), with: viewController)
    factory.stub(question: Question.singleAnswer("Q2"), with: secondViewController)
    
    sut.routeTo(question: Question.singleAnswer("Q1"), answerCallback: { _ in })
    sut.routeTo(question: Question.singleAnswer("Q2"), answerCallback: { _ in })
    
    XCTAssertEqual(navigationController.viewControllers.count, 2)
    XCTAssertEqual(navigationController.viewControllers.first, viewController)
    XCTAssertEqual(navigationController.viewControllers.last, secondViewController)
  }
  
  func test_routeToQuestion_presentsQuestionControllerWithRightCallback() {
    var callbackWasFired = false
    sut.routeTo(question: Question.singleAnswer("Q1"), answerCallback: { _ in callbackWasFired = true })
    factory.answerCallback[Question.singleAnswer("Q1")]!("anything")
    XCTAssertTrue(callbackWasFired)
  }
  
  class NonAnimatedNavigationController: UINavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
      super.pushViewController(viewController, animated: false)
    }
  }
  
  
  class ViewControllerFactoryStub: ViewControllerFactory {
    private var stubbedQuestions = Dictionary<Question<String>, UIViewController>()
    var answerCallback = Dictionary<Question<String>, (String) -> Void>()
    
    func stub(question: Question<String>, with viewController: UIViewController) {
      stubbedQuestions[question] = viewController
    }
    func questionViewController(for question: Question<String>, answerCallback: @escaping (String) -> Void) -> UIViewController {
      self.answerCallback[question] = answerCallback
      return stubbedQuestions[question] ?? UIViewController()
    }
    
  }
  
}
