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
    
    
    
}
