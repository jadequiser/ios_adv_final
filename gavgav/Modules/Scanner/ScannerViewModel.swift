//
//  ScannerViewModel.swift
//  gavgav
//
//  Created by Symbat Bayanbayeva on 09.05.2025.
//


import Foundation
import SwiftUI

final class ScannerViewModel: ObservableObject {
    @Published var lastScannedCode: String?
    @Published var shouldNavigateToCatalog = false
    
    func handleQRCode(_ code: String) {
        print("Распознан код: \(code)")
        
        guard isValid(code) else {
            print("Код невалиден: \(code)")
            return
        }
        
        lastScannedCode = code
        shouldNavigateToCatalog = true
    }
    
    private func isValid(_ code: String) -> Bool {
        return true
    }
}
