//
//  Multi_ChoiceFrontImageNTextView.swift
//  Cherry
//
//  Created by mac on 2022/11/30.
//

import SwiftUI

struct Multi_ChoiceFrontImageNTextView: View {
    @Binding var firstNaviLinkActive: Bool

    @State private var nftCollectionName: String = ""
    @State private var nftName: String = ""
    @State private var nftNumber: String = ""
    var body: some View {
        VStack{
            Image("image-choiceImage")
                .resizable()
                .frame(width: 300, height: 300)
            HStack{
                Image(systemName: "checkmark.seal.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.cyan)
                TextField("NFT 컬렉션 이름", text: $nftCollectionName)
                    .frame(width: 150, height: 30)
                    .foregroundColor(.cyan)
                    .modifier(FittingFontSizeModifier())
                
                Spacer()
                HStack{ //MARK: 버튼 테두리 감싸는거 아직 해야함.
                    Image(systemName: "arrow.clockwise")
                    Image(systemName: "square.and.arrow.up")
                    Image(systemName: "link")
                    Image(systemName: "ellipsis")
                }
                
                
            }
            HStack{
                VStack{
                    TextField("NFT이름", text: $nftName)
                        .frame(width: 300, height: 30)
                        .font(.largeTitle)
                        .multilineTextAlignment(.trailing)
                        .modifier(FittingFontSizeModifier())
                    TextField("NFT번호", text: $nftNumber)
                        .frame(width: 300, height: 30)
                        .font(.largeTitle)
                        .multilineTextAlignment(.trailing)
                        .modifier(FittingFontSizeModifier())
                    HStack{
                        Spacer()
                        Image("QRImage")
                            .resizable()
                            .frame(width: 75, height: 75)
                    }
                }
                Spacer()
            }
            NavigationLink("다음", destination: ChoiceBehindDescriptionView(firstNaviLinkActive: $firstNaviLinkActive))
                
            
        }.frame(width: 300)
    }
}

struct Multi_ChoiceFrontImageNTextView_Previews: PreviewProvider {
    static var previews: some View {
        Multi_ChoiceFrontImageNTextView(firstNaviLinkActive: .constant(true))
    }
}
