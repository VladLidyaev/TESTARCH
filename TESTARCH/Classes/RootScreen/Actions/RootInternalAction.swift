//
//  RootInternalAction.swift
//  TESTARCH
//
//  Created by Vladislav Lidiaev on 13.04.2023.
//

import UIKit

enum RootInternalAction {
  case present(controller: UIViewController)
}

protocol RootInternalController: AnyObject {
  func handle(_ action: RootInternalAction)
}
