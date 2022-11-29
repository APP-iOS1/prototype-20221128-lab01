//
//  MyView.swift
//  Cherry
//
//  Created by 박희경 on 2022/11/08.
//

import SwiftUI

struct MyView: View {
    @State private var isShowingSheet : Bool = false
    var body: some View {
        
        Home()
        
    }
    func didDismiss() {
        //...
    }
    
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}
