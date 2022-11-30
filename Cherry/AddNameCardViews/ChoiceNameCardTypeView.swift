//
//  ChoiceNameCardTypeView.swift
//  Cherry
//
//  Created by mac on 2022/11/29.
//

import SwiftUI

struct ChoiceNameCardTypeView: View {
    @Binding var stack: NavigationPath
    var body: some View {
        
        
        VStack{
            Text("명함의 타입을 선택해 주세요")
                .padding(20)
            HStack{
                Spacer()
                VStack{
                    Text("단면 명함")
                    Image("NFTcard1")
                        .resizable()
                        .frame(width: 100, height: 200)
                    NavigationLink("선택", destination: ChoiceFrontNamecardView(stack: $stack))
                }
                Spacer()
                VStack{
                    Text("양면 명함")
                    HStack{
                        Image("NFTcard1")
                            .resizable()
                            .frame(width:100, height: 200)
                        Image("NFTcard4")
                            .resizable()
                            .frame(width: 100, height: 200)
                    }
                    NavigationLink("선택", destination: Multi_ChoiceFrontNamecardView(stack: $stack))
                }
                Spacer()
            }
        }
        
    }
}

struct ChoiceNameCardTypeView_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceNameCardTypeView(stack: Binding.constant(NavigationPath()))
    }
}
