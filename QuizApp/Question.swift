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
