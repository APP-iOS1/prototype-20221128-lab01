//
//  ChoiceBehindDescriptionView.swift
//  Cherry
//
//  Created by mac on 2022/11/29.
//

import SwiftUI

struct ChoiceBehindDescriptionView: View {
    @Binding var firstNaviLinkActive: Bool
    @State private var ownerName: String = ""
    @State private var description: String = ""
    var body: some View {
        VStack{
            HStack{
                Text("owned by")
                TextField("닉네임", text: $ownerName)
                    .foregroundColor(.cyan)
                    .font(.largeTitle)
            }
            VStack{
                HStack{
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .frame(width:20, height: 20)
                    Text("Description")
                    Spacer()
                }
                TextField("소개를 써주세요", text: $description, axis: .vertical)
                    .lineLimit(3, reservesSpace: true)
                    .textFieldStyle(.roundedBorder)
            }
        }.frame(width: 300, height: 600)
    }
}

struct ChoiceBehindDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceBehindDescriptionView(firstNaviLinkActive: .constant(true))
    }
}
