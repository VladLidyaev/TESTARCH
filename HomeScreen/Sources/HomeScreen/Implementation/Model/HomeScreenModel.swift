//
//  File.swift
//  
//
//  Created by Vladislav Lidiaev on 25.02.2023.
//

import UIKit

enum HomeScreenModel {
  static var initial: HomeScreenModel = .idle
  case idle
  case presenting(on: UIViewController)
  case presented
}

protocol HomeScreenModelHolder {
  init(_ view: HomeScreenView)
  func modify(_ action: (inout HomeScreenModel) -> ())
}

final class HomeScreenModelHolderImpl: HomeScreenModelHolder {
  private var view: HomeScreenView
  private var model: HomeScreenModel

  init(_ view: HomeScreenView) {
    self.view = view
    self.model = .initial
  }

  func modify(_ action: (inout HomeScreenModel) -> ()) {
    defer { view.update(model: model) }
    action(&model)
  }
}
