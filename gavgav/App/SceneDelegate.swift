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

//        func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//            guard let windowScene = (scene as? UIWindowScene) else { return }
//            
//            // Инициализация координатора и темы
//            coordinator = AppCoordinator()
//            let theme = ThemeManager()
//            
//            // Создаем корневое View
//            let contentView = ContentView()
//                .environmentObject(coordinator)
//                .environmentObject(theme)
//            
//            // Настраиваем окно
//            window = UIWindow(windowScene: windowScene)
//            window?.rootViewController = UIHostingController(rootView: contentView)
//            window?.makeKeyAndVisible()
//        }
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//            guard let windowScene = (scene as? UIWindowScene) else { return }
//            
//            let coordinator = AppCoordinator()
//            let theme = ThemeManager()
//            
//            window = UIWindow(windowScene: windowScene)
//            window?.rootViewController = UIHostingController(
//                rootView: ContentView()
//                    .environmentObject(coordinator)
//                    .environmentObject(theme)
//            )
//            window?.makeKeyAndVisible()
//        }
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let coordinator = AppCoordinator()
        let window = UIWindow(windowScene: windowScene)
        
        window.rootViewController = UIHostingController(
            rootView: TabBarWrapper()
                .environmentObject(coordinator)
        )
        
        self.window = window
        window.makeKeyAndVisible()
    }
   

}

