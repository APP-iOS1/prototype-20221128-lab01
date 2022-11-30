//
//  QRView.swift
//  Cherry
//
//  Created by 전근섭 on 2022/11/29.
//

import SwiftUI
import CodeScanner

struct QRView: View {
    @State private var isShowingScanner: Bool = false
    @State var scannedCode: String = "https://www.google.com/"
    @State var openSafari: Bool = false
    @State var showSafari: Bool = true
    
    var scannerSheet: some View {

        CodeScannerView(
            codeTypes: [.qr],
//            simulatedData: "Some simulated data",
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code.string
                    self.isShowingScanner = false
                    self.openSafari = true
                }
            }
        )
//        }
    }
    
    var body: some View {
        
        VStack {
            
            if openSafari {
                ZStack {
                    SafariView(showSafari: $showSafari, url: URL(string: scannedCode)!)
                    
                    Button {
                        self.isShowingScanner = true
                    } label: {
                        Text("QR 코드 다시 스캔")
                            .foregroundColor(.white)
                            .padding(5)
                            .background(Color.pink)
                            .cornerRadius(10)
                    }
                    .offset(x:120, y:290)
                    .sheet(isPresented: $isShowingScanner) {
                        self.scannerSheet
                    }
                    
                }
            } else {
                Spacer()
                
                Button {
                    self.isShowingScanner = true
                } label: {
                    Text("QR 코드 다시 스캔")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.pink)
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                }
                .sheet(isPresented: $isShowingScanner) {
                    self.scannerSheet
                }
            }
            

        }
        
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
