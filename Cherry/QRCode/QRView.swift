//
//  QRView.swift
//  Cherry
//
//  Created by 전근섭 on 2022/11/29.
//

import SwiftUI
import CodeScanner

struct QRView: View {
    @State private var isShowingScanner = false
    
    var body: some View {
//        Button(action: {
//            self.isShowingScanner = true
//        }) {
//            Text("Scan QR Code")
//        }
//        .sheet(isPresented: $isShowingScanner) {
        CodeScannerView(
            codeTypes: [.qr],
            simulatedData: "Some simulated data",
            completion: self.handleScan
        )
//        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else { return }

            
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
}
