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
       // 내 명함 모아둔 tab
        Home()
        /*
        VStack {
            TopItemView(isShowingSheet: $isShowingSheet)
            Spacer()
            VStack(alignment: .trailing) {
                AsyncImage(url: URL(string: "https://media.discordapp.net/attachments/1039080936849014816/1039357737089372170/IMG_5378.jpg?width=431&height=701")) { image in
                    image
                        .resizable()
                        .frame(width: 250, height: 390)
                        .aspectRatio(contentMode: .fit)
                        
                } placeholder: {
                    Color.gray
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                    
                // 조아요, 공유, 편집 !
                CardButtonView()
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 210, trailing: 0)) // zstack
               
        }// vstack
        .sheet(isPresented: $isShowingSheet,onDismiss: didDismiss) {
            MyMenuView(isShowingSheet: $isShowingSheet)
        }
        */
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
