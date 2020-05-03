//
//  QuestionPresenter.swift
//  QuizApp
//
//  Created by Joseph McCraw on 5/3/20.
//  Copyright © 2020 Joseph McCraw. All rights reserved.
//

import Foundation

struct QuestionPresenter {
  let questions: [Question<String>]
  let question: Question<String>
  
  var title: String {
    return "Question #1"
  }
}
