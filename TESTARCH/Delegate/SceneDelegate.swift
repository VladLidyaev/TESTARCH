//
//  SceneDelegate.swift
//  TESTARCH
//
//  Created by Vladislav Lidiaev on 24.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?
  var rootScreenController: RootScreenController?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = UIWindow(windowScene: windowScene)
    window?.windowScene = windowScene
    window?.makeKeyAndVisible()

    rootScreenController = RootScreenFactoryImpl().makeController()
    rootScreenController?.handle(.shouldBePresented(on: window!))
  }

  func sceneDidDisconnect(_ scene: UIScene) {}

  func sceneDidBecomeActive(_ scene: UIScene) {}

  func sceneWillResignActive(_ scene: UIScene) {}

  func sceneWillEnterForeground(_ scene: UIScene) {}

  func sceneDidEnterBackground(_ scene: UIScene) {}
}

