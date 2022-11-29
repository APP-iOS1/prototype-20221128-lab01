//
//  MyUsersCardView.swift
//  Cherry
//
//  Created by 허두영 on 2022/11/08.
//

import SwiftUI

struct MyMenuView: View {
    @Binding var isShowingSheet : Bool
    
    var body: some View {
        VStack {
            HStack{
                Button(action: {
                    isShowingSheet.toggle()
                }) {
                    Text("back")
                }
            }
            List{
                ForEach(0..<19, id: \.self) { _ in
                    Text("adasdsadas")
                }
            }
        }
    }
}
//
//struct MyCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyCardView()
//    }
//}
