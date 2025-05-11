//
//  TabBarWrapper.swift
//  gavgav
//
//  Created by Symbat Bayanbayeva on 09.05.2025.
//

//import SwiftUI
//
//struct TabBarWrapper: UIViewControllerRepresentable {
//    @EnvironmentObject private var coordinator: AppCoordinator
//    
//    func makeUIViewController(context: Context) -> MainTabBarController {
//        let controller = MainTabBarController()
//        controller.coordinator = coordinator
//        return controller
//    }
//    
//    func updateUIViewController(_ uiViewController: MainTabBarController, context: Context) {}
//}
//import SwiftUI
//
//struct TabBarWrapper: UIViewControllerRepresentable {
//    @EnvironmentObject private var coordinator: AppCoordinator
//    
//    func makeUIViewController(context: Context) -> MainTabBarController {
//        let controller = MainTabBarController()
//        controller.coordinator = coordinator
//        return controller
//    }
//    
//    func updateUIViewController(_ uiViewController: MainTabBarController, context: Context) {}
//}

import SwiftUI

struct TabBarWrapper: UIViewControllerRepresentable {
    @EnvironmentObject var coordinator: AppCoordinator
    
    func makeUIViewController(context: Context) -> MainTabBarController {
        let controller = MainTabBarController()
        controller.coordinator = coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: MainTabBarController, context: Context) {}
}
