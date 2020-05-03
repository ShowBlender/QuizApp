//
//  ResultsPresenterTest.swift
//  QuizAppTests
//
//  Created by Joseph McCraw on 5/2/20.
//  Copyright © 2020 Joseph McCraw. All rights reserved.
//

import Foundation
import XCTest
import QuizEngine
@testable import QuizApp

class ResultsPresenterTest: XCTestCase {
  
  func test_summary_withTwoQuestionsaAndScoreOne_returnSummary() {
    let answers = [Question.singleAnswer("Q1"): ["A1"], Question.multipleAnswer("Q2"): ["A2", "A3"]]
    let result = Result(answers: answers, score: 1)
    let sut = ResultsPresenter(result: result, questions: [Question.singleAnswer("Q1"), Question.multipleAnswer("Q2")], correctAnswers: [:])
    XCTAssertEqual(sut.summary, "You got 1/2 Correct")
    XCTAssertNotEqual(sut.summary, "You got 2/2 Correct") 
  }
  func test_summary_withThreeQuestionsaAndScoreTwo_returnSummary() {
    let answers = [Question.singleAnswer("Q1"): ["A1"], Question.multipleAnswer("Q2"): ["A2", "A3"], Question.multipleAnswer("Q3"): ["A4", "A5"]]
    let result = Result(answers: answers, score: 2)
    let sut = ResultsPresenter(result: result, questions: [Question.singleAnswer("Q1"), Question.multipleAnswer("Q2"), Question.multipleAnswer("Q3")], correctAnswers: [:])
    XCTAssertEqual(sut.summary, "You got 2/3 Correct")
    XCTAssertNotEqual(sut.summary, "You got 1/2 Correct")
  }
  func test_presentableAnswers_emptyScoreZero_isEmpty() {
    let answers = Dictionary<Question<String>, [String]>()
    let result = Result(answers: answers, score: 0)
    let sut = ResultsPresenter(result: result, questions: [], correctAnswers: [:])
    XCTAssertTrue(sut.presentableAnswers.isEmpty)
  }
  func test_presentableAnswers_withWrongSingleAnswer_mapsAnswer() {
    let answers = [Question.singleAnswer("Q1"): ["A1"]]
    let correctAnswers = [Question.singleAnswer("Q1"): ["A2"]]
    let result = Result(answers: answers, score: 0)
    let sut = ResultsPresenter(result: result, questions: [Question.singleAnswer("Q1")], correctAnswers: correctAnswers)
    XCTAssertEqual(sut.presentableAnswers.count, 1)
    XCTAssertEqual(sut.presentableAnswers.first!.question, "Q1")
    XCTAssertEqual(sut.presentableAnswers.first!.answer, "A2")
    XCTAssertEqual(sut.presentableAnswers.first!.wrongAnswer, "A1")
  }
  func test_presentableAnswers_withWrongMultipleAnswer_mapsAnswer() {
    let answers = [Question.multipleAnswer("Q1"): ["A1", "A4"]]
    let correctAnswers = [Question.multipleAnswer("Q1"): ["A2", "A3"]]
    let result = Result(answers: answers, score: 0)
    let sut = ResultsPresenter(result: result, questions: [Question.multipleAnswer("Q1")], correctAnswers: correctAnswers)
    XCTAssertEqual(sut.presentableAnswers.count, 1)
    XCTAssertEqual(sut.presentableAnswers.first!.question, "Q1")
    XCTAssertEqual(sut.presentableAnswers.first!.answer, "A2, A3")
    XCTAssertEqual(sut.presentableAnswers.first!.wrongAnswer, "A1, A4")
  }
  func test_presentableAnswers_withRightSingleAnswer_mapsAnswer() {
    let answers = [Question.singleAnswer("Q1"): ["A1"]]
    let correctAnswers = [Question.singleAnswer("Q1"): ["A1"]]
    let result = Result(answers: answers, score: 1)
    let sut = ResultsPresenter(result: result, questions: [Question.singleAnswer("Q1")], correctAnswers: correctAnswers)
    XCTAssertEqual(sut.presentableAnswers.count, 1)
    XCTAssertEqual(sut.presentableAnswers.first!.question, "Q1")
    XCTAssertEqual(sut.presentableAnswers.first!.answer, "A1")
    XCTAssertNil(sut.presentableAnswers.first!.wrongAnswer)
  }
  func test_presentableAnswers_withRightMultipleAnswer_mapsAnswer() {
    let answers = [Question.multipleAnswer("Q1"): ["A1", "A4"]]
    let correctAnswers = [Question.multipleAnswer("Q1"): ["A1", "A4"]]
    let result = Result(answers: answers, score: 1)
    let sut = ResultsPresenter(result: result, questions: [Question.multipleAnswer("Q1")], correctAnswers: correctAnswers)
    XCTAssertEqual(sut.presentableAnswers.count, 1)
    XCTAssertEqual(sut.presentableAnswers.first!.question, "Q1")
    XCTAssertEqual(sut.presentableAnswers.first!.answer, "A1, A4")
    XCTAssertNil(sut.presentableAnswers.first!.wrongAnswer)
  }
  
  //Not a great test, as it can give false negative
  func test_presentableAnswers_withTwoQuestions_mapsOrderedAnswer() {
    let answers = [Question.singleAnswer("Q2"): ["A2"], Question.singleAnswer("Q1"): ["A1", "A4"]]
    let correctAnswers = [Question.singleAnswer("Q2"): ["A2"], Question.singleAnswer("Q1"): ["A1", "A4"]]
    let orderedQuestions = [Question.singleAnswer("Q1"), Question.singleAnswer("Q2")]

    let result = Result(answers: answers, score: 0)
    let sut = ResultsPresenter(result: result, questions: orderedQuestions, correctAnswers: correctAnswers)

    XCTAssertEqual(sut.presentableAnswers.count, 2)
    XCTAssertEqual(sut.presentableAnswers.first!.question, "Q1")
    XCTAssertEqual(sut.presentableAnswers.first!.answer, "A1, A4")
    XCTAssertNil(sut.presentableAnswers.first!.wrongAnswer)

    XCTAssertEqual(sut.presentableAnswers.last!.question, "Q2")
    XCTAssertEqual(sut.presentableAnswers.last!.answer, "A2")
    XCTAssertNil(sut.presentableAnswers.last!.wrongAnswer)
  }
}
