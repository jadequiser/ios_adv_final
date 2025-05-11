//
//  MainTabBarController.swift
//  gavgav
//
//  Created by Symbat Bayanbayeva on 10.05.2025.
//
//import UIKit
//import SwiftUI
//
//class MainTabBarController: UITabBarController {
//    weak var coordinator: AppCoordinator?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupTabs()
//    }
//    
//    private func setupTabs() {
//        guard let coordinator = coordinator else { return }
//        
//        // Вкладка сканера
//        let scannerView = ScannerView()
//            .environmentObject(coordinator)
//        let scannerVC = UIHostingController(rootView: scannerView)
//        scannerVC.tabBarItem = UITabBarItem(
//            title: "Сканер",
//            image: UIImage(systemName: "qrcode"),
//            tag: 0
//        )
//        
//        // Вкладка каталога (заглушка)
//        let catalogVC = UIHostingController(rootView: Text("Каталог"))
//        catalogVC.tabBarItem = UITabBarItem(
//            title: "Каталог",
//            image: UIImage(systemName: "list.bullet"),
//            tag: 1
//        )
//        
//        viewControllers = [
//            UINavigationController(rootViewController: scannerVC),
//            UINavigationController(rootViewController: catalogVC)
//        ]
//    }
//}


//import UIKit
import SwiftUI
//
//class MainTabBarController: UITabBarController {
//    weak var coordinator: AppCoordinator?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupTabs()
//        setupAppearance()
//    }
//    
//    private func setupTabs() {
//        guard let coordinator = coordinator else { return }
//        
//        // 1. Сканер
//        let scannerView = ScannerView()
//            .environmentObject(coordinator)
//        let scannerVC = wrapInNavigation(
//            view: scannerView,
//            title: "Сканер",
//            icon: "qrcode",
//            tag: 0
//        )
//        
//        // 2. Каталог
//        let catalogView = CatalogView()
//        let catalogVC = wrapInNavigation(
//            view: catalogView,
//            title: "Каталог",
//            icon: "list.bullet",
//            tag: 1
//        )
//        
//        // 3. Чат
//        let chatView = ChatView()
//        let chatVC = wrapInNavigation(
//            view: chatView,
//            title: "Чат",
//            icon: "message",
//            tag: 2
//        )
//        
//        // 4. Профиль
//        let profileView = ProfileView()
//        let profileVC = wrapInNavigation(
//            view: profileView,
//            title: "Профиль",
//            icon: "person",
//            tag: 3
//        )
//        
//        viewControllers = [scannerVC, catalogVC, chatVC, profileVC]
//    }
//    
//    private func wrapInNavigation(view: some View, title: String, icon: String, tag: Int) -> UIViewController {
//        let hostingVC = UIHostingController(rootView: view)
//        hostingVC.tabBarItem = UITabBarItem(
//            title: title,
//            image: UIImage(systemName: icon),
//            tag: tag
//        )
//        return UINavigationController(rootViewController: hostingVC)
//    }
//    
//    private func setupAppearance() {
//        tabBar.tintColor = .systemBlue
//        tabBar.unselectedItemTintColor = .gray
//    }
//}
import UIKit

class MainTabBarController: UITabBarController {
    weak var coordinator: AppCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabs()
        setupAppearance()
    }
    
    private func setupTabs() {
        // 1. Сканер
        let scannerVC = createNavController(
            rootView: ScannerView(),
            title: "Сканер",
            icon: "qrcode"
        )
        
        // 2. Каталог (заглушка)
        let catalogVC = createNavController(
            rootView: Text("Каталог"),
            title: "Каталог",
            icon: "list.bullet"
        )
        
        // 3. Чат (заглушка)
        let chatVC = createNavController(
            rootView: Text("Чат"),
            title: "Чат",
            icon: "message"
        )
        
        // 4. Профиль (заглушка)
        let profileVC = createNavController(
            rootView: Text("Профиль"),
            title: "Профиль",
            icon: "person"
        )
        
        viewControllers = [scannerVC, catalogVC, chatVC, profileVC]
    }
    
    private func createNavController(rootView: some View, title: String, icon: String) -> UIViewController {
        let hostingVC = UIHostingController(rootView: rootView)
        hostingVC.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: icon),
            tag: viewControllers?.count ?? 0
        )
        return UINavigationController(rootViewController: hostingVC)
    }
    
    private func setupAppearance() {
        tabBar.isTranslucent = false
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .gray
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = appearance
        }
    }
}
