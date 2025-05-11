//
//  ScannerViewModel.swift
//  gavgav
//
//  Created by Symbat Bayanbayeva on 09.05.2025.
//

//import Foundation
//
//final class ScannerViewModel: ObservableObject {
//    @Published var lastScannedCode: String?
//    
//    func handleQRCode(_ code: String) {
//        guard isValid(code) else { return }
//        lastScannedCode = code
//    }
//    
//    private func isValid(_ code: String) -> Bool {
//        code.lowercased().hasPrefix("museumapp://")
//    }
//}
import Foundation

final class ScannerViewModel: ObservableObject {
    // 1. Публикуемое свойство для хранения последнего распознанного кода
    @Published var lastScannedCode: String?
    
    // 2. Функция обработки QR-кода
    func handleQRCode(_ code: String) {
        print("Распознан код: \(code)") // Логирование для отладки
        
        // 3. Проверка валидности кода
        guard isValid(code) else {
            print("Код невалиден: \(code)")
            return
        }
        
        // 4. Сохранение кода (вызовет автоматическое обновление View)
        lastScannedCode = code
    }
    
    // 5. Проверка формата кода
    private func isValid(_ code: String) -> Bool {
        code.lowercased().hasPrefix("museumapp://")
    }
}
