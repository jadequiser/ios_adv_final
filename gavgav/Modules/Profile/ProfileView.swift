//
//  ProfileView.swift
//  gavgav
//
//  Created by Symbat Bayanbayeva on 09.05.2025.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var theme: ThemeManager
    
    var body: some View {
        NavigationStack {
            Form {
                Toggle("Тёмная тема", isOn: $theme.isDarkMode)
                    .toggleStyle(.switch)
                    .onChange(of: theme.isDarkMode) {
                        updateWindowTheme()
                    }
            }
            .navigationTitle("Профиль")
        }
    }
    
    private func updateWindowTheme() {
        // Принудительное обновление UIKit окон
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        windowScene?.windows.forEach { window in
            window.overrideUserInterfaceStyle = theme.isDarkMode ? .dark : .light
        }
    }
}
