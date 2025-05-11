//
//  ContentView.swift
//  gavgav
//
//  Created by Symbat Bayanbayeva on 09.05.2025.
//
import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    @EnvironmentObject private var theme: ThemeManager
    
    var body: some View {
        TabBarWrapper()
            .ignoresSafeArea()
            .preferredColorScheme(theme.isDarkMode ? .dark : .light)
    }
}

#Preview {
    ContentView()
        .environmentObject(AppCoordinator())
        .environmentObject(ThemeManager())
}
