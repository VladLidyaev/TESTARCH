//
//  HomeScreenExternalController.swift
//  
//
//  Created by Vladislav Lidiaev on 25.02.2023.
//

import Foundation

public enum HomeScreenExternalAction {}

public protocol HomeScreenExternalController: AnyObject {
  init(_ delegate: HomeScreenControllerDelegate)
  func handle(_ action: HomeScreenExternalAction)
}
