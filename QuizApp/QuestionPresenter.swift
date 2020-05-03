//
//  QuestionPresenter.swift
//  QuizApp
//
//  Created by Joseph McCraw on 5/3/20.
//  Copyright © 2020 Joseph McCraw. All rights reserved.
//

import Foundation
import QuizEngine

struct QuestionPresenter {
  let questions: [Question<String>]
  let question: Question<String>
  
  var title: String {
    guard let index = questions.firstIndex(of: question) else { return "" }
    return "Question #\(index + 1)"
  }
}
