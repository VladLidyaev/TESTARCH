//
//  RootController.swift
//  TESTARCH
//
//  Created by Vladislav Lidiaev on 13.04.2023.
//

import UIKit

protocol RootController: RootExternalController, RootInternalController {
  init(modelHolder: RootModelHolder)
}

final class RootControllerImpl: RootController {
  private let modelHolder: RootModelHolder
  private weak var window: UIWindow?

  init(modelHolder: RootModelHolder) {
    self.modelHolder = modelHolder
  }

  func handle(_ action: RootExternalAction) {
    modifyAction(action) { [weak self] action in
      self?.modelHolder.modify { model in
        RootEngine.process(&model, with: action)
      }
    }
  }

  func handle(_ action: RootInternalAction) {
    modifyAction(action) { [weak self] action in
      self?.modelHolder.modify { model in
        RootEngine.process(&model, with: action)
      }
    }
  }

  private func modifyAction(_ action: RootExternalAction, _ completion: (RootAction) -> Void ) {
    switch action {
    case .shouldBePresented(let window):
      self.window = window
      completion(.shouldBePresented)
    }
  }

  private func modifyAction(_ action: RootInternalAction, _ completion: (RootAction) -> Void ) {
    switch action {
    case .present(let controller):
      window?.rootViewController = controller
      completion(.present)
    }
  }
}
