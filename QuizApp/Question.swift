//
//  Question.swift
//  QuizApp
//
//  Created by Joseph McCraw on 5/1/20.
//  Copyright © 2020 Joseph McCraw. All rights reserved.
//

import Foundation

enum Question<T: Hashable>: Hashable {
  case singleAnswer(T)
  case multipleAnswer(T)
  
  func hash(into hasher: inout Hasher) {
    switch self {
    case .singleAnswer(let a):
      hasher.combine(a)
    case .multipleAnswer(let a):
      hasher.combine(a)
    }
  }
  
  static func ==(lhs: Question<T>, rhs: Question<T>) -> Bool {
    switch (lhs, rhs) {
      case (.singleAnswer(let a), .singleAnswer(let b)):
        return a == b
      case (.multipleAnswer(let a), .multipleAnswer(let b)):
        return a == b
    default:
      return false
    }
  }
  
}
