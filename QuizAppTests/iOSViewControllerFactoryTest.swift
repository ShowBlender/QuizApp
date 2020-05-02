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
  func test_questionViewController_createsControllerWithCorrectQuestion() {
    let question = Question.singleAnswer("Q1")
    let options = ["A1", "A2"]
    let sut = iOSViewControllerFactory(options: [question: options])
    let controller = sut.questionViewController(for: Question.singleAnswer("Q1"), answerCallback: { _ in }) as? QuestionViewController
    
    XCTAssertEqual(controller?.question, "Q1")
    
  }
  func test_questionViewController_createsControllerWithCorrectOptions() {
    let question = Question.singleAnswer("Q1")
    let options = ["A1", "A2"]
    let sut = iOSViewControllerFactory(options: [question: options])
    let controller = sut.questionViewController(for: question, answerCallback: { _ in }) as? QuestionViewController
     
    XCTAssertEqual(controller?.options, options)
     
   }
  
}
