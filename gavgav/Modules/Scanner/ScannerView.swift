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
        .onChange(of: viewModel.lastScannedCode) { [weak viewModel] _, _ in
            guard let code = viewModel?.lastScannedCode, !code.isEmpty else { return }
            coordinator.switchToCatalogTab() // ← Вот этот вызов!
            isScanningActive = false
        }
        .onAppear {
            isScanningActive = true
        }
    }
}
