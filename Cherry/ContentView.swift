//
//  ContentView.swift
//  Cherry
//
//  Created by 박희경 on 2022/11/08.
//

import SwiftUI




struct ContentView: View {
    
    let logoutAction: () -> Void
    
    @State private var tabSelection = 1
    @State var isShowingCamera: Bool = false
    @State private var presentSheet: Bool = false
    
     var body: some View {
        TabView(selection: $tabSelection) {
            MyView().tabItem {
                Image(systemName: "person.crop.rectangle.stack")
                Text("내명함")
            }.tag(1)
            UsersView().tabItem {
                Image(systemName: "person.2.crop.square.stack")
                Text("명함수집함")
            }.tag(2)
            
            AddView().tabItem {
                Image(systemName: "qrcode.viewfinder")
                Text("QR")
            }.tag(3)
    
            TempView().tabItem {
                Image(systemName: "questionmark.circle")
                Text("준비중")
            }.tag(4)
                
            
            MyPageView().tabItem {
                Image(systemName: "person.crop.circle")
                Text("마이페이지")

            }.tag(5)
 
        }.navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(logoutAction: {})
    }
}
