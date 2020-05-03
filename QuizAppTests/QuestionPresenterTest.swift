//
//  QuestionPresenterTest.swift
//  QuizAppTests
//
//  Created by Joseph McCraw on 5/3/20.
//  Copyright © 2020 Joseph McCraw. All rights reserved.
//

import Foundation
import XCTest
@testable import QuizApp

class QuestionPresenterTest: XCTestCase {
  
  func test_title_forFirstQuestion() {
    let question1 = Question.singleAnswer("A1")
    
    let sut = QuestionPresenter(questions: [question1], question: question1)
    
    XCTAssertEqual(sut.title, "Question #1")
  }
  
}
