//
//  RootScreenEngine.swift
//  TESTARCH
//
//  Created by Vladislav Lidiaev on 13.04.2023.
//

import UIKit

enum RootScreenAction {
  case shouldBePresented
  case present
  case presentChild
}

enum RootScreenEngine {
  static func process(
    _ model: inout RootScreenModel,
    with action: RootScreenAction
  ) {
    switch action {
    case .shouldBePresented:
      model = .presenting
    case .present:
      model = .presented
    case .presentChild:
      model = .presentedChild
    }
  }
}
