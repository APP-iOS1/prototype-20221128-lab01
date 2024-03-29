//
//  Multi_ChoiceFrontOnlyImageView.swift
//  Cherry
//
//  Created by mac on 2022/11/30.
//

import SwiftUI

struct Multi_ChoiceFrontOnlyImageView: View {
    @Binding var firstNaviLinkActive: Bool
    @State private var nftCollectionName: String = ""
    @State private var nftName: String = ""
    @State private var nftNumber: String = ""
    var body: some View {
        ZStack{
            Image("image-choiceImage")
                .resizable()
                
            TextField("NFT컬렉션 이름", text:$nftCollectionName)
                .multilineTextAlignment(.trailing)
                .font(.largeTitle)
                .position(x: 150, y:450)
            TextField("NFT이름", text:$nftName)
                .multilineTextAlignment(.trailing)
                .font(.title2)
                .position(x: 150, y:480)
            TextField("NFT번호", text:$nftNumber)
                .multilineTextAlignment(.trailing)
                .font(.title2)
                .position(x: 150, y:500)
            Image("QRImage")
                .resizable()
                .frame(width: 75, height: 75)
                .position(x:260, y: 550)
            NavigationLink("다음", destination: ChoiceBehindDescriptionView(firstNaviLinkActive: $firstNaviLinkActive))
                .position(x: 150, y: 620)
        }.frame(width: 300, height: 600)
    }
}

struct Multi_ChoiceFrontOnlyImageView_Previews: PreviewProvider {
    static var previews: some View {
        Multi_ChoiceFrontOnlyImageView(firstNaviLinkActive: .constant(true))
    }
}
