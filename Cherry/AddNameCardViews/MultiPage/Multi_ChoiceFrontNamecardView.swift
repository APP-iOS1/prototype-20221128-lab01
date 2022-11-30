//
//  Multi_ChoiceFrontNamecardView.swift
//  Cherry
//
//  Created by mac on 2022/11/30.
//

import SwiftUI

struct Multi_ChoiceFrontNamecardView: View {
    @Binding var firstNaviLinkActive: Bool
    //어떤 템플릿을 선택했는지에 따라서
    //ChoiceFrontOnlyImageView와 ChoiceFrontImageNTextView로 나뉘
    var body: some View {
        VStack{
            HStack{
                Text("앞면에 들어갈 템플릿을 선택해 주세요")
            }.padding(20)
            HStack{
                Spacer()
                VStack{
                    Text("template1")
                    Image("NFTcard1")
                        .resizable()
                        .frame(width: 150, height: 250)
                    NavigationLink("선택", destination: Multi_ChoiceFrontImageNTextView(firstNaviLinkActive: $firstNaviLinkActive))
                            
                    
                    
                }
                Spacer()
                VStack{
                    Text("template2")
                    Image("template-front2")
                        .resizable()
                        .frame(width: 150, height: 250)
                    
                    NavigationLink("선택", destination: Multi_ChoiceFrontOnlyImageView(firstNaviLinkActive: $firstNaviLinkActive))
                        
                }
                Spacer()
            }.padding(20)
        }
    }
}

struct Multi_ChoiceFrontNamecardView_Previews: PreviewProvider {
    static var previews: some View {
        Multi_ChoiceFrontNamecardView(firstNaviLinkActive: .constant(true))
    }
}
