//
//  SafariView.swift
//  Cherry
//
//  Created by 전근섭 on 2022/11/30.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    
    @Binding var showSafari: Bool
    
    let url: URL

     func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
         return SFSafariViewController(url: url)
     }

     func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
         return
     }
}

struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView(showSafari: .constant(true), url: URL(string: "https://www.google.com/")!)
    }
}
