//
//  File.swift
//  
//
//  Created by Vladislav Lidiaev on 25.02.2023.
//

import Foundation

final class HomeScreenModelHolder {
  private var view: HomeScreenView
  private var model: HomeScreenModel = .initial

  init(view: HomeScreenView) {
    self.view = view
  }

  func modify(_ action: (inout HomeScreenModel) -> ()) {
    defer { view.update(model: model) }
    action(&model)
  }
}
