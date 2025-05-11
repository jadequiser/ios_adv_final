//
//  AppCoordinator.swift
//  gavgav
//
//  Created by Symbat Bayanbayeva on 09.05.2025.
//
import UIKit



import SwiftUI

import Combine

final class AppCoordinator: ObservableObject {
    private weak var tabBarController: MainTabBarController?
    var objectWillChange = PassthroughSubject<Void, Never>()
    
    func switchToCatalogTab() {
        print("Пытаюсь переключить на каталог. TabBarController: \(tabBarController != nil)")

        tabBarController?.selectedIndex = 1
        objectWillChange.send()
    }
}
