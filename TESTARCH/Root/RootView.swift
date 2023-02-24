//
//  LaunchViewController.swift
//  TESTARCH
//
//  Created by Vladislav Lidiaev on 25.02.2023.
//

import UIKit

class RootView: UIViewController {
  private lazy var rootController = makeRootController()

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  private func makeRootController() -> RootController {
    RootController()
  }
}
