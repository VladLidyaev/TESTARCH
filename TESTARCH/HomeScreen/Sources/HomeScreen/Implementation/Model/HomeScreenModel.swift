//
//  File.swift
//  
//
//  Created by Vladislav Lidiaev on 25.02.2023.
//

import Foundation

enum HomeScreenModel {
  static var initial: HomeScreenModel = .idle

  case idle
  case value(Int)
}
