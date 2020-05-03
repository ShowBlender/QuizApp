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
  let options = ["A1", "A2"]
  
  func test_questionViewController_singleAnswer_createsControllerWithCorrectQuestion() {
    XCTAssertEqual(makeQuestionController(question: Question.singleAnswer("Q1")).question, "Q1")
  }
  
  func test_questionViewController_singleAnswer_createsControllerWithCorrectOptions() {
    XCTAssertEqual(makeQuestionController(question: Question.singleAnswer("Q1")).options, options)
   }
  
  func test_questionViewController_singleAnswer_createsControllerWithSingleSelection() {
    let controller = makeQuestionController()
    _ = controller.view
    XCTAssertFalse(controller.tableView.allowsMultipleSelection)
   }
  
  func test_questionViewController_multipleAnswer_createsControllerWithCorrectQuestion() {
    XCTAssertEqual(makeQuestionController(question: Question.multipleAnswer("Q1")).question, "Q1")
  }
  
  func test_questionViewController_multipleAnswer_createsControllerWithCorrectOptions() {
    XCTAssertEqual(makeQuestionController(question: Question.multipleAnswer("Q1")).options, options)
   }
  
  func test_questionViewController_multipleAnswer_createsControllerWithSingleSelection() {
    let controller = makeQuestionController(question: Question.multipleAnswer("Q1"))
    _ = controller.view
    XCTAssertTrue(controller.tableView.allowsMultipleSelection)
   }
  
  //MARK: Helpers
  func makeSUT(options: Dictionary<Question<String>, [String]>) -> iOSViewControllerFactory {
    return iOSViewControllerFactory(options: options)
  }
  
  func makeQuestionController(question: Question<String> = Question.singleAnswer("")) -> QuestionViewController {
    return makeSUT(options: [question: options]).questionViewController(for: question, answerCallback: { _ in }) as! QuestionViewController
  }
  
  
}
