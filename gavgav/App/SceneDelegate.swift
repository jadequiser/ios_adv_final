//
//  SceneDelegate.swift
//  gavgav
//
//  Created by Symbat Bayanbayeva on 09.05.2025.
//
import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
        private var coordinator: AppCoordinator!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let coordinator = AppCoordinator()
        let window = UIWindow(windowScene: windowScene)
        
        let tabBarController = MainTabBarController()
        window.rootViewController = tabBarController
        
        self.window = window
        window.makeKeyAndVisible()
    }
   

}
