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
  func questionViewController(for question: Question<String>, answerCallback: @escaping (String) -> Void) -> UIViewController {
    return QuestionViewController()
  }
  
  func resultViewController(for result: Result<Question<String>, String>) -> UIViewController {
    return UIViewController()
  }
  
  
}
