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
  let correctAnswers: Dictionary<Question<String>, [String]>
  
  var summary: String {
    return "You got \(result.score)/\(result.answers.count) Correct"
  }
  var presentableAnswers: [PresentableAnswer] {
    return result.answers.map { (question, userAnswer) in
      guard let correctAnswer = correctAnswers[question] else {
        fatalError("Could Not find correct answer for question \(question)")
      }
      return presentableAnswer(question, userAnswer, correctAnswer)
    }
  }
  
  private func presentableAnswer(_ question: Question<String>,
                                 _ userAnswer: [String] ,
                                 _ correctAnswer: [String]) -> PresentableAnswer {
    let wrongAnswer = correctAnswer == userAnswer ? nil : userAnswer.joined(separator: ", ")
    
    switch question {
    case .singleAnswer(let value), .multipleAnswer(let value):
      return PresentableAnswer(question: value,
                               answer: correctAnswer.joined(separator: ", ") ,
                               wrongAnswer: wrongAnswer)
    }
  }
  
}


