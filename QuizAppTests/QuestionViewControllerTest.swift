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
    XCTAssertEqual(makeSUT(question: "Q1").headerLabel.text, "Q1")
  }
  
  func test_viewDidLoad_rendersOptions() {
    XCTAssertEqual(makeSUT(options: []).tableView.numberOfRows(inSection: 0), 0)
    XCTAssertEqual(makeSUT(options: ["A1"]).tableView.numberOfRows(inSection: 0), 1)
    XCTAssertEqual(makeSUT(options: ["A1", "A2"]).tableView.numberOfRows(inSection: 0), 2)
  }
  
  func test_viewDidLoad_rendersOptionText() {
    XCTAssertEqual(makeSUT(options: ["A1", "A2"]).tableView.title(at: 0), "A1")
    XCTAssertEqual(makeSUT(options: ["A1", "A2"]).tableView.title(at: 1), "A2")
  }
  
  func test_viewDidLoad_withSingleSelection_configuresTableView() {
    XCTAssertFalse(makeSUT(options: ["A1", "A2"], allowsMultipleSelection: false).tableView.allowsMultipleSelection)
  }
  
  func test_viewDidLoad_withMultipleSelection_configuresTableView() {
    XCTAssertTrue(makeSUT(options: ["A1", "A2"], allowsMultipleSelection: true).tableView.allowsMultipleSelection)
  }
  
  
  
  func test_optionSelected_withSingleSelection_notifiesDelegateWithLastSelected() {
    var receivedAnswer = [String]()
    
    let sut = makeSUT(options: ["A1", "A2"], allowsMultipleSelection: false) { receivedAnswer = $0 }
    
    sut.tableView.select(row: 0)
    XCTAssertEqual(receivedAnswer, ["A1"])
    
    sut.tableView.select(row: 1)
    XCTAssertEqual(receivedAnswer, ["A2"])
  }
  
  
  func test_optionDeselected_withTwoOptions_DoesNotNotifyDelegateWithEmptySelection() {
    var callbackCount = 0
    
    let sut = makeSUT(options: ["A1", "A2"], allowsMultipleSelection: false) { _ in callbackCount += 1 }
    
    sut.tableView.select(row: 0)
    XCTAssertEqual(callbackCount, 1)
    
    sut.tableView.deselect(row: 0)
    XCTAssertEqual(callbackCount, 1)
  }
  
  
  func test_optionSelected_withMultipleSelection_notifiesDelegateWithLastSelected() {
    var receivedAnswer = [String]()
    
    let sut = makeSUT(options: ["A1", "A2"], allowsMultipleSelection: true) { receivedAnswer = $0 }
    
    sut.tableView.select(row: 0)
    XCTAssertEqual(receivedAnswer, ["A1"])
    
    sut.tableView.select(row: 1)
    XCTAssertEqual(receivedAnswer, ["A1", "A2"])
  }
  
  func test_optionDeselected_withMultipleSelection_notifiesDelegateWithLastSelected() {
    var receivedAnswer = [String]()
    
    let sut = makeSUT(options: ["A1", "A2"], allowsMultipleSelection: true) { receivedAnswer = $0 }
    
    sut.tableView.select(row: 0)
    XCTAssertEqual(receivedAnswer, ["A1"])
    
    sut.tableView.deselect(row: 0)
    XCTAssertEqual(receivedAnswer, [])
  }
  
  
  // MARK: Helper
  func makeSUT(question: String = "", options: [String] = [], allowsMultipleSelection: Bool = false, selection: @escaping ([String]) -> Void = { _ in }) -> QuestionViewController {
    let sut = QuestionViewController(question: question, options: options, allowsMultipleSelection: allowsMultipleSelection, selection: selection)
    _ = sut.view  // Loads view, Docs suggest you should not invoke viewDidLoad
    return sut
  }
}

