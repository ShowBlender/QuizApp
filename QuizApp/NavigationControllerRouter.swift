//
//  NavigationControllerRouter.swift
//  QuizApp
//
//  Created by Joseph McCraw on 4/30/20.
//  Copyright © 2020 Joseph McCraw. All rights reserved.
//

import UIKit
import QuizEngine

enum Question<T: Hashable>: Hashable {
  case singleAnswer(T)
  case multipleAnswer(T)
  
  // TODO: 'Hashable.hashValue' is deprecated as a protocol requirement; conform type 'Question' to 'Hashable' by implementing 'hash(into:)' instead
  
  var hashValue: Int {
    switch self {
    case .singleAnswer(let a):
      return a.hashValue
    case .multipleAnswer(let a):
      return a.hashValue
    }
  }
  
  static func ==(lhs: Question<T>, rhs: Question<T>) -> Bool {
    return false //lhs == rhs
  }
  
}

protocol ViewControllerFactory {
  func questionViewController(for question: String, answerCallback: @escaping (String) -> Void) -> UIViewController
}

class NavigationControllerRouter: Router {
  
  private let navigationController: UINavigationController
  private let factory: ViewControllerFactory
  
  init(_ navigationController: UINavigationController, factory: ViewControllerFactory) {
    self.navigationController = navigationController
    self.factory = factory
  }
  
  func routeTo(question: String, answerCallback: @escaping (String) -> Void) {
    let viewController = factory.questionViewController(for: question, answerCallback: answerCallback)
    navigationController.pushViewController(viewController, animated: true)
  }
  func routeTo(result: Result<String, String>) {
    
  }
}
