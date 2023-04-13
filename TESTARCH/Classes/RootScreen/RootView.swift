//
//  RootView.swift
//  TESTARCH
//
//  Created by Vladislav Lidiaev on 13.04.2023.
//

import UIKit

protocol RootView {
  var controller: RootInternalController? { set get }
  func update(model: RootModel)
}

final class RootViewImpl: UIViewController, RootView {
  weak var controller: RootInternalController?

  func update(model: RootModel) {
    switch model {
    case .idle:
      break
    case .presenting:
      controller?.handle(.present(controller: self))
    case .presented:
      view.backgroundColor = .red
    }
  }
}
