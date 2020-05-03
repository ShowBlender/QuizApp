//
//  ResultsPresenter.swift
//  QuizApp
//
//  Created by Joseph McCraw on 5/2/20.
//  Copyright © 2020 Joseph McCraw. All rights reserved.
//

import Foundation
import QuizEngine

struct ResultsPresenter {
  let result: Result<Question<String>, [String]>
  
  var summary: String {
    return "You got 1/2 Correct"
  }
}


