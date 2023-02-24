//
//  File.swift
//  
//
//  Created by Vladislav Lidiaev on 25.02.2023.
//

import Foundation

struct HomeScreenEngine {
  private init() {}
  static func process(
    _ model: inout HomeScreenModel,
    with action: HomeScreenExternalAction
  ) -> HomeScreenEffect? {
    .none
  }

  static func process(
    _ model: inout HomeScreenModel,
    with action: HomeScreenInternalAction
  ) -> HomeScreenEffect? {
    .none
  }
}
