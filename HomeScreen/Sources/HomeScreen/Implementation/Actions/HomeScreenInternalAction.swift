//
//  HomeScreenInternalAction.swift
//  
//
//  Created by Vladislav Lidiaev on 13.04.2023.
//

import Foundation

enum HomeScreenInternalAction {
  case presented
}

protocol HomeScreenInternalController: AnyObject {
  func handle(_ action: HomeScreenInternalAction)
}
