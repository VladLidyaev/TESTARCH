//
//  File.swift
//  
//
//  Created by Vladislav Lidiaev on 25.02.2023.
//

import Foundation
import Networking

protocol HomeScreenController: HomeScreenExternalController, HomeScreenInternalController {
  init(delegate: HomeScreenControllerDelegate, modelHolder: HomeScreenModelHolder)
}

final class HomeScreenControllerImpl: HomeScreenController {
  private weak var delegate: HomeScreenControllerDelegate!
  private let modelHolder: HomeScreenModelHolder

  init(delegate: HomeScreenControllerDelegate, modelHolder: HomeScreenModelHolder) {
    self.delegate = delegate
    self.modelHolder = modelHolder
  }

  func handle(_ action: HomeScreenExternalAction) {
    modifyAction(action) { [weak self] action in
      self?.modifyModel(action)
    }
  }

  func handle(_ action: HomeScreenInternalAction) {
    modifyAction(action) { [weak self] action in
      self?.modifyModel(action)
    }
  }

  private func modifyAction(
    _ action: HomeScreenExternalAction,
    _ completion: (HomeScreenAction) -> Void
  ) {
    switch action {
    case .shouldBePresented(let controller):
      completion(.shouldBePresented(on: controller))
    }
  }

  private func modifyAction(
    _ action: HomeScreenInternalAction,
    _ completion: (HomeScreenAction) -> Void
  ) {
    switch action {
    case .presented:
      startLoadingNews()
      completion(.fetchingNews)
    }
  }

  private func modifyModel(_ action: HomeScreenAction) {
    modelHolder.modify { [weak self] model in
      guard let effect = HomeScreenEngine.process(&model, with: action) else { return }
      self?.delegate.handle(effect)
    }
  }

  // MARK: - Actions and Workers

  private func startLoadingNews() {
    DispatchQueue.global(qos: .userInitiated).async {
      NetworkingProvider.dataRequest(
        with: "https://newsapi.org/v2/top-headlines?country=ru&apiKey=8004401d05d041ed8ae9e0ae9a8b1d20",
        objectType: NewsModel.self
      ) { [weak self] result in
        switch result {
        case .success(let model):
          print(model)
          self?.modifyModel(.successFetchedNews(model))
        case .failure(_):
          self?.modifyModel(.failureFetchedNews)
        }
      }
    }
  }
}
