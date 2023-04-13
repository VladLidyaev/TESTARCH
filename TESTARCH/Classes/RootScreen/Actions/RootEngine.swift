//
//  RootEngine.swift
//  TESTARCH
//
//  Created by Vladislav Lidiaev on 13.04.2023.
//

import Foundation

enum RootAction {
  case shouldBePresented
  case present
}

enum RootEngine {
  static func process(
    _ model: inout RootModel,
    with action: RootAction
  ) {
    switch action {
    case .shouldBePresented:
      model = .presenting
    case .present:
      model = .presented
    }
  }
}
