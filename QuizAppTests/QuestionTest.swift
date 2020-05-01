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
  
  func test_hashValue_singleAnswer_returnsTypeHash() {
    let type = "a string"
    let sut = Question.singleAnswer(type)
    
    XCTAssertEqual(sut.hashValue, type.hashValue)
  }
  
  func test_hashValue_multipleAnswer_returnsTypeHash() {
    let type = "a string"
    let sut = Question.multipleAnswer(type)
    
    XCTAssertEqual(sut.hashValue, type.hashValue)
  }
}

