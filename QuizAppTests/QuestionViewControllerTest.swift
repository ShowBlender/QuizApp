//
//  QuestionViewControllerTest.swift
//  QuizAppTests
//
//  Created by Joseph McCraw on 4/27/20.
//  Copyright © 2020 Joseph McCraw. All rights reserved.
//

import XCTest
@testable import QuizApp

class QuestionViewControllerTest: XCTestCase {
    
    func test_viewDidLoad_rendersQuestionHeaderText() {
        let sut = QuestionViewController(question: "Q1", options: [])
        
        _ = sut.view  // Loads view, Docs suggest you should not invoke viewDidLoad
        
        XCTAssertEqual(sut.headerLabel.text, "Q1")
    }
    
    func test_viewDidLoad_withNoOptions_rendersZeroOptions() {
        let sut = QuestionViewController(question: "Q1", options: [])
        
        _ = sut.view  // Loads view, Docs suggest you should not invoke viewDidLoad
        
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
    }
    
    func test_viewDidLoad_withOneOptions_rendersOneOptions() {
        let sut = QuestionViewController(question: "Q1", options: ["A1"])
        
        _ = sut.view  // Loads view, Docs suggest you should not invoke viewDidLoad
        
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
    }
    
}
