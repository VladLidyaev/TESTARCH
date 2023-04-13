import UIKit

/*

// MARK: - Factory

public protocol Factory {
  func makeController(_ delegate: ControllerDelegate) -> ExternalController
}

public final class FactoryImpl: Factory {
  public func makeController(_ delegate: ControllerDelegate) -> ExternalController {
    let view = ViewImpl()
    let modelHolder = ModelHolderImpl(view)
    let controller = ControllerImpl(
      delegate: delegate,
      modelHolder: modelHolder
    )
    view.controller = controller

    return controller
  }
}

// MARK: - Effect

public enum Effect {}

public protocol ControllerDelegate: AnyObject {
  func handle(_ effect: Effect)
}

// MARK: - ExternalAction

public enum ExternalAction {}

public protocol ExternalController: AnyObject {
  func handle(_ action: ExternalAction)
}

// MARK: - InternalAction

private enum InternalAction {}

private protocol InternalController: AnyObject {
  func handle(_ action: InternalAction)
}

// MARK: - Controller

private protocol Controller: ExternalController, InternalController {
  init(delegate: ControllerDelegate, modelHolder: ModelHolder)
}

private final class ControllerImpl: Controller {
  private weak var delegate: ControllerDelegate!
  private let modelHolder: ModelHolder

  init(delegate: ControllerDelegate, modelHolder: ModelHolder) {
    self.delegate = delegate
    self.modelHolder = modelHolder
  }

  func handle(_ action: ExternalAction) {
    modifyAction(action) { [weak self] action in
      self?.modelHolder.modify { model in
        guard let effect = Engine.process(&model, with: action) else { return }
        self?.delegate.handle(effect)
      }
    }
  }

  func handle(_ action: InternalAction) {
    modifyAction(action) { [weak self] action in
      self?.modelHolder.modify { model in
        guard let effect = Engine.process(&model, with: action) else { return }
        self?.delegate.handle(effect)
      }
    }
  }

 private func modifyAction(_ action: ExternalAction, _ completion: (Action) -> Void ) {}

 private func modifyAction(_ action: InternalAction, _ completion: (Action) -> Void ) {}

}

// MARK: - View

private protocol View {
  var controller: InternalController? { set get }
  func update(model: Model)
}

private final class ViewImpl: UIViewController, View {
  weak var controller: InternalController?
  func update(model: Model) {}
}

// MARK: - Model

private enum Model {
  static var initial: Model = .idle
  case idle
}

private protocol ModelHolder {
  init(_ view: View)
  func modify(_ action: (inout Model) -> ())
}

private final class ModelHolderImpl: ModelHolder {
  private var view: View
  private var model: Model

  init(_ view: View) {
    self.view = view
    self.model = .initial
  }

  func modify(_ action: (inout Model) -> ()) {
    defer { view.update(model: model) }
    action(&model)
  }
}

// MARK: - Engine

 public enum Action {}

private enum Engine {
  static func process(
    _ model: inout Model,
    with action: Action
  ) -> Effect? {
    .none
  }
}

*/
