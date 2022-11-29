//
//  AddView.swift
//  Cherry
//
//  Created by 박훈종 on 2022/11/10.
//

import SwiftUI

struct AddView: View {
    
    @State private var presentSheet: Bool = false
    
    var body: some View {
        VStack {
            NavigationView {
                QRView()
//                Button("Modal") {
//                    presentSheet = true
//
//                }.sheet(isPresented: $presentSheet) {
//
//                }
            }
        }
    }
    
    struct AddView_Previews: PreviewProvider {
        static var previews: some View {
            AddView()
        }
    }
}
