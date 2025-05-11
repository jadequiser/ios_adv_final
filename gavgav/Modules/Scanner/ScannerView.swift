//
//  QRScannerView.swift
//  gavgav
//
//  Created by Symbat Bayanbayeva on 09.05.2025.


import SwiftUI

struct ScannerView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    @StateObject private var viewModel = ScannerViewModel()
    @State private var isScanningActive = true
    
    var body: some View {
        ZStack {
            if isScanningActive {
                QRScannerView(codeHandler: viewModel.handleQRCode)
                    .ignoresSafeArea()
            }
            
            VStack {
                Text("Наведите камеру на QR-код")
                    .padding()
                    .background(.thinMaterial)
                    .clipShape(Capsule())
                    .padding(.top, 40)
                
                Spacer()
            }
        }
        .onChange(of: viewModel.shouldNavigateToCatalog) { shouldNavigate in
            if shouldNavigate {
                print("Пытаюсь переключить на каталог. TabBarController: \(UIApplication.shared.windows.first?.rootViewController is MainTabBarController)")
                NotificationCenter.default.post(name: .switchToCatalogTab, object: nil)
                isScanningActive = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    viewModel.shouldNavigateToCatalog = false
                }
            }
        }
        .onAppear {
            isScanningActive = true
        }
    }
}
