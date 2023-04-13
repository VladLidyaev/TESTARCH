//
//  RootScreenModel.swift
//  TESTARCH
//
//  Created by Vladislav Lidiaev on 13.04.2023.
//

import UIKit

enum RootScreenModel {
  static var initial: RootScreenModel = .idle
  case idle
  case presenting
  case presented
  case presentedChild
}

protocol RootScreenModelHolder {
  init(_ view: RootScreenView)
  func modify(_ action: (inout RootScreenModel) -> ())
}

final class RootScreenModelHolderImpl: RootScreenModelHolder {
  private var view: RootScreenView
  private var model: RootScreenModel

  init(_ view: RootScreenView) {
    self.view = view
    self.model = .initial
  }

  func modify(_ action: (inout RootScreenModel) -> ()) {
    defer { view.update(model: model) }
    action(&model)
  }
}
