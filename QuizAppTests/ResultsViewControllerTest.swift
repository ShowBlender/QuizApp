//
//  ResultsViewControllerTest.swift
//  QuizAppTests
//
//  Created by Joseph McCraw on 4/28/20.
//  Copyright © 2020 Joseph McCraw. All rights reserved.
//

import Foundation
import XCTest

class ResultsViewControllerTest: XCTestCase {
    func test_viewDidLoad_renderSummary() {
        let sut = ResultsViewController(summary: "A Summary")
        _ = sut.view
        XCTAssertEqual(sut.headerLabel.text, "A Summary")
    }
    
    func test_viewDidLoad_withoutAnswers_doesNotRenderAnswers() {
        let sut = ResultsViewController(summary: "A Summary", answers: [])
        _ = sut.view
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
    }
    
    func test_viewDidLoad_withOneAnswer_RenderAnswer() {
        let sut = ResultsViewController(summary: "A Summary", answers: ["A1"])
        _ = sut.view
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0))?.textLabel?.text, "A1")
    }
    
}
