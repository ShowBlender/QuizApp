//
//  iOSViewControllerFactory.swift
//  QuizApp
//
//  Created by Joseph McCraw on 5/1/20.
//  Copyright © 2020 Joseph McCraw. All rights reserved.
//

import UIKit
import QuizEngine

class iOSViewControllerFactory: ViewControllerFactory {
  private let options: Dictionary<Question<String>, [String]>
  init(options: Dictionary<Question<String>, [String]>) {
    self.options = options
  }
  
  func questionViewController(for question: Question<String>, answerCallback: @escaping ([String]) -> Void) -> UIViewController {
    switch question {
    case .singleAnswer(let a):
      return QuestionViewController(question: a, options: options[question]!, selection: answerCallback)
    default:
      return UIViewController()
    }
    return QuestionViewController()
  }
  
  func resultViewController(for result: Result<Question<String>, [String]>) -> UIViewController {
    return UIViewController()
  }
}
