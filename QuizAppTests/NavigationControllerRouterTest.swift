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
  func test_routeToQuestion_presentsQuestionController() {
    let navigationController = UINavigationController()
    
    let sut = NavigationControllerRouter(navigationController)
    sut.routeTo(question: "Q1", answerCallback: { _ in })
    
    XCTAssertEqual(navigationController.viewControllers.count, 1)
  }

}
