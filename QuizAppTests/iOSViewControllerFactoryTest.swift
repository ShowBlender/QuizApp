//
//  iOSViewControllerFactoryTest.swift
//  QuizAppTests
//
//  Created by Joseph McCraw on 5/1/20.
//  Copyright © 2020 Joseph McCraw. All rights reserved.
//

import Foundation
import XCTest
@testable import QuizApp

class iOSViewControllerFactoryTest: XCTestCase {
  func test_questionViewController_createsController() {
    let sut = iOSViewControllerFactory()
    let controller = sut.questionViewController(for: Question.singleAnswer("Q1"), answerCallback: { _ in }) as? QuestionViewController
    
    XCTAssertNotNil(controller)
    
  }
}
