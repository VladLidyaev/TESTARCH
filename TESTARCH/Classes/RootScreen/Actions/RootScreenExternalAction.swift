//
//  RootScreenExternalAction.swift
//  TESTARCH
//
//  Created by Vladislav Lidiaev on 13.04.2023.
//

import UIKit

enum RootScreenExternalAction {
  case shouldBePresented(on: UIWindow)
}

protocol RootScreenExternalController: AnyObject {
  func handle(_ action: RootScreenExternalAction)
}
