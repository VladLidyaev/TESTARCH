//
//  RootFactory.swift
//  TESTARCH
//
//  Created by Vladislav Lidiaev on 13.04.2023.
//

import Foundation

protocol RootFactory {
  func makeController() -> RootController
}

final class RootFactoryImpl: RootFactory {
  func makeController() -> RootController {
    let view = RootViewImpl()
    let modelHolder = RootModelHolderImpl(view)
    let controller = RootControllerImpl(modelHolder: modelHolder)
    view.controller = controller

    return controller
  }
}
