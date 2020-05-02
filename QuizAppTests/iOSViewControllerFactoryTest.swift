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
  let question = Question.singleAnswer("Q1")
  let options = ["A1", "A2"]
  
  func test_questionViewController_singleAnswer_createsControllerWithCorrectQuestion() {
    XCTAssertEqual(makeQuestionController().question, "Q1")
  }
  
  func test_questionViewController_singleAnswer_createsControllerWithCorrectOptions() {
    XCTAssertEqual(makeQuestionController().options, options)
   }
  
  func test_questionViewController_singleAnswer_createsControllerWithSingleSelection() {
    let sut = iOSViewControllerFactory(options: [question: options])
    let controller = sut.questionViewController(for: question, answerCallback: { _ in }) as! QuestionViewController
    _ = controller.view
    XCTAssertFalse(controller.tableView.allowsMultipleSelection)
   }
  
  //MARK: Helpers
  func makeQuestionController() -> QuestionViewController {
    return makeSUT().questionViewController(for: Question.singleAnswer("Q1"), answerCallback: { _ in }) as! QuestionViewController
  }
  
  func makeSUT() -> iOSViewControllerFactory {
    return iOSViewControllerFactory(options: [question: options])
  }
  
}
