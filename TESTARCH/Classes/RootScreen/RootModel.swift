//
//  RootModel.swift
//  TESTARCH
//
//  Created by Vladislav Lidiaev on 13.04.2023.
//

import Foundation

enum RootModel {
  static var initial: RootModel = .idle
  case idle
  case presenting
  case presented
}

protocol RootModelHolder {
  init(_ view: RootView)
  func modify(_ action: (inout RootModel) -> ())
}

final class RootModelHolderImpl: RootModelHolder {
  private var view: RootView
  private var model: RootModel

  init(_ view: RootView) {
    self.view = view
    self.model = .initial
  }

  func modify(_ action: (inout RootModel) -> ()) {
    defer { view.update(model: model) }
    action(&model)
  }
}
