//
//  RootExternalAction.swift
//  TESTARCH
//
//  Created by Vladislav Lidiaev on 13.04.2023.
//

import UIKit

enum RootExternalAction {
  case shouldBePresented(on: UIWindow)
}

protocol RootExternalController: AnyObject {
  func handle(_ action: RootExternalAction)
}
