//
//  HomeScreenExternalController.swift
//  
//
//  Created by Vladislav Lidiaev on 25.02.2023.
//

import UIKit

public enum HomeScreenExternalAction {
  case shouldBePresented(on: UIViewController)
}

public protocol HomeScreenExternalController: AnyObject {
  func handle(_ action: HomeScreenExternalAction)
}
