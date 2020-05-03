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
    let sut = ResultsPresenter(result: result)
    XCTAssertEqual(sut.summary, "You got 1/2 Correct")
    XCTAssertNotEqual(sut.summary, "You got 2/2 Correct")
  }
  func test_summary_withThreeQuestionsaAndScoreTwo_returnSummary() {
    let answers = [Question.singleAnswer("Q1"): ["A1"], Question.multipleAnswer("Q2"): ["A2", "A3"], Question.multipleAnswer("Q3"): ["A4", "A5"]]
    let result = Result(answers: answers, score: 2)
    let sut = ResultsPresenter(result: result)
    XCTAssertEqual(sut.summary, "You got 2/3 Correct")
    XCTAssertNotEqual(sut.summary, "You got 1/2 Correct")
  }
}
