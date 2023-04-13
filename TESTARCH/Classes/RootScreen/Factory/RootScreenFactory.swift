//
//  RootScreenFactory.swift
//  TESTARCH
//
//  Created by Vladislav Lidiaev on 13.04.2023.
//

import Foundation

protocol RootScreenFactory {
  func makeController() -> RootScreenController
}

final class RootScreenFactoryImpl: RootScreenFactory {
  func makeController() -> RootScreenController {
    let view = RootScreenViewImpl()
    let modelHolder = RootScreenModelHolderImpl(view)
    let controller = RootScreenControllerImpl(modelHolder: modelHolder)
    view.controller = controller
    return controller
  }
}
