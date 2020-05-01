//
//  QuestionTest.swift
//  QuizAppTests
//
//  Created by Joseph McCraw on 5/1/20.
//  Copyright © 2020 Joseph McCraw. All rights reserved.
//

import Foundation
import XCTest
@testable import QuizApp

class QuestionTest: XCTestCase {
  
  func test_equal_singleAnswer_isEqual() {
    XCTAssertEqual(Question.singleAnswer("a string"), Question.singleAnswer("a string"))
    XCTAssertEqual(Question.multipleAnswer("a string"), Question.multipleAnswer("a string"))
  }
  func test_notEqual_singleAnswer_isNotEqual() {
    XCTAssertNotEqual(Question.singleAnswer("a string"), Question.singleAnswer("different string"))
    XCTAssertNotEqual(Question.multipleAnswer("a string"), Question.multipleAnswer("different string"))
    XCTAssertNotEqual(Question.singleAnswer("a string"), Question.multipleAnswer("a string"))
    XCTAssertNotEqual(Question.singleAnswer("a string"), Question.multipleAnswer("different string"))
  }
  
}

