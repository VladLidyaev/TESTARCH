//
//  File.swift
//  
//
//  Created by Vladislav Lidiaev on 25.02.2023.
//

import Foundation

public final class HomeScreenController: HomeScreenExternalController, HomeScreenInternalController {
  private weak var delegate: HomeScreenControllerDelegate!
  private lazy var modelHolder: HomeScreenModelHolder = makeModelHolder()

  public init(_ delegate: HomeScreenControllerDelegate) {
    self.delegate = delegate
  }

  public func handle(_ action: HomeScreenExternalAction) {
    modelHolder.modify { [weak self] model in
      guard let effect = HomeScreenEngine.process(&model, with: action) else { return }
      self?.delegate.handle(effect)
    }
  }

  func handle(_ action: HomeScreenInternalAction) {
    modelHolder.modify { [weak self] model in
      guard let effect = HomeScreenEngine.process(&model, with: action) else { return }
      self?.delegate.handle(effect)
    }
  }

  private func makeModelHolder() -> HomeScreenModelHolder {
    let view = HomeScreenView(self)
    return HomeScreenModelHolder(view: view)
  }
}
