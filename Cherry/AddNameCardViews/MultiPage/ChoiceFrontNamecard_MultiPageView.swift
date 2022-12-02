//
//  ChoiceFrontNamecard_MultiPage.swift
//  Cherry
//
//  Created by mac on 2022/12/02.
//

import SwiftUI

struct ChoiceFrontNamecard_MultiPage: View {
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
                    NavigationLink("선택", destination: ChoiceFrontInfo_MultiPageView(frontTemplateType: 1, firstNaviLinkActive: $firstNaviLinkActive))
                            
                    
                    
                }
                Spacer()
                VStack{
                    Text("template2")
                    Image("template-front2")
                        .resizable()
                        .frame(width: 150, height: 250)
                    
                    NavigationLink("선택", destination: ChoiceFrontInfo_MultiPageView(frontTemplateType: 2, firstNaviLinkActive: $firstNaviLinkActive))
                        
                }
                Spacer()
            }.padding(20)
        }
    }
}
