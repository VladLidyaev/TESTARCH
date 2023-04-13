//
//  File.swift
//  
//
//  Created by Vladislav Lidiaev on 25.02.2023.
//

import UIKit

final class HomeScreenView: UIViewController {
  private weak var controller: HomeScreenInternalController!

  init(_ controller: HomeScreenInternalController) {
    super.init(nibName: nil, bundle: nil)
    self.controller = controller
  }

  @available(*, unavailable)
  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func update(model: HomeScreenModel) {}
}
