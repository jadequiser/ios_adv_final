//
//  MainTabBarController.swift
//  gavgav
//
//  Created by Symbat Bayanbayeva on 10.05.2025.
//

import SwiftUI
import UIKit

class MainTabBarController: UITabBarController {
    weak var coordinator: AppCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabs()
        setupAppearance()
        NotificationCenter.default.addObserver(self, selector: #selector(handleSwitchToCatalogTab), name: .switchToCatalogTab, object: nil)
    }
    
    @objc private func handleSwitchToCatalogTab() {
        print("Switching to Catalog tab")
        switchToTab(index: 1) // 1 is the index for Catalog
    }
    
    func switchToTab(index: Int) {
        selectedIndex = index
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

extension Notification.Name {
    static let switchToCatalogTab = Notification.Name("switchToCatalogTab")
}
