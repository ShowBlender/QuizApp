//
//  iOSViewControllerFactoryTest.swift
//  QuizAppTests
//
//  Created by Joseph McCraw on 5/1/20.
//  Copyright © 2020 Joseph McCraw. All rights reserved.
//

import Foundation
import XCTest
import QuizEngine
@testable import QuizApp

class iOSViewControllerFactoryTest: XCTestCase {
  let options = ["A1", "A2"]
  let singleAnswerQuestion = Question.singleAnswer("Q1")
  let multipleAnswerQuestion = Question.multipleAnswer("Q1")
  
  func test_questionViewController_singleAnswer_createsControllerWithTitle() {
    let presenter = QuestionPresenter(questions: [singleAnswerQuestion, multipleAnswerQuestion], question: singleAnswerQuestion)
    XCTAssertEqual(makeQuestionController(question: singleAnswerQuestion).title, presenter.title)
  }
  
  func test_questionViewController_singleAnswer_createsControllerWithCorrectQuestion() {
    XCTAssertEqual(makeQuestionController(question: singleAnswerQuestion).question, "Q1")
  }
  
  func test_questionViewController_singleAnswer_createsControllerWithCorrectOptions() {
    XCTAssertEqual(makeQuestionController(question: singleAnswerQuestion).options, options)
   }
  
  func test_questionViewController_singleAnswer_createsControllerWithSingleSelection() {
    let controller = makeQuestionController()
    XCTAssertFalse(controller.allowsMultipleSelection)
   }
  func test_questionViewController_multipleAnswer_createsControllerWithTitle() {
    let presenter = QuestionPresenter(questions: [singleAnswerQuestion, multipleAnswerQuestion], question: multipleAnswerQuestion)
    XCTAssertEqual(makeQuestionController(question: multipleAnswerQuestion).title, presenter.title)
  }
  
  func test_questionViewController_multipleAnswer_createsControllerWithCorrectQuestion() {
    XCTAssertEqual(makeQuestionController(question: multipleAnswerQuestion).question, "Q1")
  }
  
  func test_questionViewController_multipleAnswer_createsControllerWithCorrectOptions() {
    XCTAssertEqual(makeQuestionController(question: multipleAnswerQuestion).options, options)
   }
  
  func test_questionViewController_multipleAnswer_createsControllerWithSingleSelection() {
    let controller = makeQuestionController(question: multipleAnswerQuestion)
    XCTAssertTrue(controller.allowsMultipleSelection)
   }
  
  func test_resultsViewController_createsController() {
    let sut = makeSUT(options: [:])
    let controller = sut.resultViewController(for: Result(answers: Dictionary<Question<String>, [String]>(), score: 0)) as? ResultsViewController
    XCTAssertNotNil(controller)
  }
  
  
  //MARK: Helpers
  func makeSUT(options: Dictionary<Question<String>, [String]>) -> iOSViewControllerFactory {
    return iOSViewControllerFactory(questions: [singleAnswerQuestion, multipleAnswerQuestion], options: options)
  }
  
  func makeQuestionController(question: Question<String> = Question.singleAnswer("")) -> QuestionViewController {
    return makeSUT(options: [question: options]).questionViewController(for: question, answerCallback: { _ in }) as! QuestionViewController
  }
  
  
}
