//
//  File.swift
//  
//
//  Created by Vladislav Lidiaev on 25.02.2023.
//

import Foundation

protocol HomeScreenController: HomeScreenExternalController, HomeScreenInternalController {
  init(delegate: HomeScreenControllerDelegate, modelHolder: HomeScreenModelHolder)
}

final class HomeScreenControllerImpl: HomeScreenController {
  private weak var delegate: HomeScreenControllerDelegate!
  private let modelHolder: HomeScreenModelHolder

  init(delegate: HomeScreenControllerDelegate, modelHolder: HomeScreenModelHolder) {
    self.delegate = delegate
    self.modelHolder = modelHolder
  }

  func handle(_ action: HomeScreenExternalAction) {
    modifyAction(action) { [weak self] action in
      self?.modelHolder.modify { model in
        guard let effect = HomeScreenEngine.process(&model, with: action) else { return }
        self?.delegate.handle(effect)
      }
    }
  }

  func handle(_ action: HomeScreenInternalAction) {
    modifyAction(action) { [weak self] action in
      self?.modelHolder.modify { model in
        guard let effect = HomeScreenEngine.process(&model, with: action) else { return }
        self?.delegate.handle(effect)
      }
    }
  }

  private func modifyAction(
    _ action: HomeScreenExternalAction,
    _ completion: (HomeScreenAction) -> Void
  ) {
    switch action {
    case .shouldBePresented(let controller):
      completion(.shouldBePresented(on: controller))
    }
  }

  private func modifyAction(
    _ action: HomeScreenInternalAction,
    _ completion: (HomeScreenAction) -> Void
  ) {
    switch action {
    case .presented:
      completion(.presented)
    }
  }
}
