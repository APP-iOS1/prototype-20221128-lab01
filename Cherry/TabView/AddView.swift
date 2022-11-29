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
                Button("Modal") {
                    presentSheet = true
                    
                }.sheet(isPresented: $presentSheet) {
                    Text("Detail")
                        .presentationDetents([.medium, .large])
                }
            }
        }
    }
    
    struct AddView_Previews: PreviewProvider {
        static var previews: some View {
            AddView()
        }
    }
}
