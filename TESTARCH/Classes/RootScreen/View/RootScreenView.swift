//
//  RootScreenView.swift
//  TESTARCH
//
//  Created by Vladislav Lidiaev on 13.04.2023.
//

import UIKit

protocol RootScreenView {
  var controller: RootScreenInternalController? { set get }
  func update(model: RootScreenModel)
}

final class RootScreenViewImpl: UIViewController, RootScreenView {
  weak var controller: RootScreenInternalController?

  init() {
    super.init(nibName: nil, bundle: nil)
    setup()
  }

  @available(*, unavailable)
  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    controller?.handle(.presentChild(on: self))
  }

  func update(model: RootScreenModel) {
    switch model {
    case .idle:
      break
    case .presenting:
      controller?.handle(.present(controller: self))
    case .presented:
      break
    case .presentedChild:
      break
    }
  }

  private func setup() {
    modalPresentationStyle = .fullScreen
  }
}
