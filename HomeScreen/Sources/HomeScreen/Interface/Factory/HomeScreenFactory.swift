//
//  HomeScreenFactory.swift
//  
//
//  Created by Vladislav Lidiaev on 13.04.2023.
//

import Foundation

public protocol HomeScreenFactory {
  func makeController(_ delegate: HomeScreenControllerDelegate) -> HomeScreenExternalController
}

public final class HomeScreenFactoryImpl: HomeScreenFactory {
  public init() {}

  public func makeController(_ delegate: HomeScreenControllerDelegate) -> HomeScreenExternalController {
    let view = HomeScreenViewImpl()
    let modelHolder = HomeScreenModelHolderImpl(view)
    let controller = HomeScreenControllerImpl(
      delegate: delegate,
      modelHolder: modelHolder
    )
    view.controller = controller

    return controller
  }
}
