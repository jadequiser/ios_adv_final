//
//  QRScannerView.swift
//  gavgav
//
//  Created by Symbat Bayanbayeva on 11.05.2025.
//



import AVKit
import SwiftUI

struct QRScannerView: UIViewControllerRepresentable {
    let codeHandler: (String) -> Void
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(codeHandler: codeHandler)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}
}

class ScannerVC: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    private let codeHandler: (String) -> Void
    private var captureSession: AVCaptureSession!
    
    init(codeHandler: @escaping (String) -> Void) {
        self.codeHandler = codeHandler
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCamera()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updatePreviewLayerFrame()
    }
    
    private func setupCamera() {
        guard let device = AVCaptureDevice.default(for: .video),
              let input = try? AVCaptureDeviceInput(device: device) else {
            print("Camera access error")
            return
        }
        
        captureSession = AVCaptureSession()
        
        guard captureSession.canAddInput(input) else {
            print("Cannot add input")
            return
        }
        captureSession.addInput(input)
        
        let output = AVCaptureMetadataOutput()
        guard captureSession.canAddOutput(output) else {
            print("Cannot add output")
            return
        }
        captureSession.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [.qr]
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.captureSession.startRunning()
        }
    }
    
    private func updatePreviewLayerFrame() {
        if let previewLayer = view.layer.sublayers?.first as? AVCaptureVideoPreviewLayer {
            previewLayer.frame = view.bounds
        }
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput,
                       didOutput metadataObjects: [AVMetadataObject],
                       from connection: AVCaptureConnection) {
        guard let qrObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
              let code = qrObject.stringValue else { return }
        
        // Остановим сканирование после первого успешного распознавания
        captureSession.stopRunning()
        codeHandler(code)
    }
}
