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
    guard let options = options[question] else { fatalError("Couldn't find options for question.") }
    return questionViewController(for: question, options: options, answerCallback: answerCallback)
  }
  
  private func questionViewController(for question: Question<String>, options: [String], answerCallback: @escaping ([String]) -> Void) -> UIViewController {
    switch question {
     case .singleAnswer(let a):
      let controller = QuestionViewController(question: a, options: options, selection: answerCallback)
      controller.title = "Question #1"
       return controller
     case .multipleAnswer(let a):
       let controller = QuestionViewController(question: a, options: options, selection: answerCallback)
       _ = controller.view
       controller.tableView.allowsMultipleSelection = true
       return controller
     }
  }
  
  func resultViewController(for result: Result<Question<String>, [String]>) -> UIViewController {
    return UIViewController()
  }
}
