//
//  File.swift
//  
//
//  Created by Vladislav Lidiaev on 25.02.2023.
//

import UIKit

protocol HomeScreenView {
  var controller: HomeScreenInternalController? { set get }
  func update(model: HomeScreenModel)
}

final class HomeScreenViewImpl: UIViewController, HomeScreenView {
  weak var controller: HomeScreenInternalController?

  init() {
    super.init(nibName: nil, bundle: nil)
    setup()
  }

  @available(*, unavailable)
  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func update(model: HomeScreenModel) {
    switch model {
    case .idle:
      break
    case .presenting(let viewController):
      viewController.present(self, animated: false) {
        self.controller?.handle(.presented)
      }
    case .presented:
      break
    }
  }

  private func setup() {
    modalPresentationStyle = .fullScreen
  }
}
