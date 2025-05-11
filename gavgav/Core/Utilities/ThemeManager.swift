//
//  ThemeManager.swift
//  gavgav
//
//  Created by Symbat Bayanbayeva on 10.05.2025.
//
import SwiftUI

class ThemeManager: ObservableObject {
    @Published var isDarkMode: Bool = false {
        didSet {
            UserDefaults.standard.set(isDarkMode, forKey: "darkMode")
            NotificationCenter.default.post(name: .themeChanged, object: nil)
        }
    }
    
    init() {
        self.isDarkMode = UserDefaults.standard.bool(forKey: "darkMode")
    }
}

extension Notification.Name {
    static let themeChanged = Notification.Name("themeChanged")
}
