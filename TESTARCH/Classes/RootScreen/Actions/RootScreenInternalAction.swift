//
//  RootInternalAction.swift
//  TESTARCH
//
//  Created by Vladislav Lidiaev on 13.04.2023.
//

import UIKit

enum RootScreenInternalAction {
  case present(controller: UIViewController)
  case presentChild(on: UIViewController)
}

protocol RootScreenInternalController: AnyObject {
  func handle(_ action: RootScreenInternalAction)
}
