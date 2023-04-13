//
//  RootScreenController.swift
//  TESTARCH
//
//  Created by Vladislav Lidiaev on 13.04.2023.
//

import UIKit
import HomeScreen

protocol RootScreenController: RootScreenExternalController, RootScreenInternalController {
  init(modelHolder: RootScreenModelHolder)
}

final class RootScreenControllerImpl: RootScreenController {
  private let modelHolder: RootScreenModelHolder
  private weak var window: UIWindow?
  private var controller: HomeScreenExternalController?

  init(modelHolder: RootScreenModelHolder) {
    self.modelHolder = modelHolder
  }

  func handle(_ action: RootScreenExternalAction) {
    modifyAction(action) { [weak self] action in
      self?.modifyModel(action)
    }
  }

  func handle(_ action: RootScreenInternalAction) {
    modifyAction(action) { [weak self] action in
      self?.modifyModel(action)
    }
  }

  private func modifyAction(_ action: RootScreenExternalAction, _ completion: (RootScreenAction) -> Void ) {
    switch action {
    case .shouldBePresented(let window):
      setWindow(window)
      completion(.shouldBePresented)
    }
  }

  private func modifyAction(_ action: RootScreenInternalAction, _ completion: (RootScreenAction) -> Void ) {
    switch action {
    case .present(let controller):
      setRootViewController(controller)
      completion(.present)
    case .presentChild(let controller):
      presentHomeScreen(on: controller)
      completion(.presentChild)
    }
  }

  private func modifyEffect(_ effect: HomeScreen.HomeScreenEffect, _ completion: (RootScreenAction) -> Void ) {}

  private func modifyModel(_ action: RootScreenAction) {
    modelHolder.modify { model in
      RootScreenEngine.process(&model, with: action)
    }
  }
  
  // MARK: - Actions and Workers

  private func setWindow(_ window: UIWindow) {
    self.window = window
  }

  private func setRootViewController(_ controller: UIViewController) {
    window?.rootViewController = controller
  }

  private func presentHomeScreen(on viewController: UIViewController) {
    controller = HomeScreenFactoryImpl().makeController(self)
    controller?.handle(.shouldBePresented(on: viewController))
  }
}

extension RootScreenControllerImpl: HomeScreenControllerDelegate {
  func handle(_ effect: HomeScreen.HomeScreenEffect) {
    modifyEffect(effect) { [weak self] action in
      self?.modifyModel(action)
    }
  }
}
