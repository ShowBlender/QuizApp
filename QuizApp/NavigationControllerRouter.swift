//
//  NavigationControllerRouter.swift
//  QuizApp
//
//  Created by Joseph McCraw on 4/30/20.
//  Copyright © 2020 Joseph McCraw. All rights reserved.
//

import UIKit
import QuizEngine


protocol ViewControllerFactory {
  func questionViewController(for question: Question<String>, answerCallback: @escaping (String) -> Void) -> UIViewController
  func resultViewController(for result: Result<Question<String>, String>) -> UIViewController
}

class NavigationControllerRouter: Router {
  
  private let navigationController: UINavigationController
  private let factory: ViewControllerFactory
  
  init(_ navigationController: UINavigationController, factory: ViewControllerFactory) {
    self.navigationController = navigationController
    self.factory = factory
  }
  
  func routeTo(question: Question<String>, answerCallback: @escaping (String) -> Void) {
    show(factory.questionViewController(for: question, answerCallback: answerCallback))
  }
  func routeTo(result: Result<Question<String>, String>) {
    show(factory.resultViewController(for: result))
    
  }
  private func show(_ viewController: UIViewController) {
    navigationController.pushViewController(viewController, animated: true)
  }
}
