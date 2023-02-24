//
//  HomeScreenInternalController.swift
//  
//
//  Created by Vladislav Lidiaev on 25.02.2023.
//

import Foundation

enum HomeScreenInternalAction {}

protocol HomeScreenInternalController: AnyObject {
  func handle(_ action: HomeScreenInternalAction)
}
