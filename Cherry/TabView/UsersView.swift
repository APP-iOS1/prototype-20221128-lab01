//
//  UsersView.swift
//  Cherry
//
//  Created by 박희경 on 2022/11/08.
//

import SwiftUI

struct UsersView: View {
    @State private var isShowingSheet : Bool = false
    var body: some View {
        // 다른사람 명함 모아둔 tab
        Home()
    }
        func didDismiss(){
            //...
        }
        
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
