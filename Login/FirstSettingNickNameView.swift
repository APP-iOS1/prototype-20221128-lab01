//
//  FirstSettingNickNameView.swift
//  Cherry
//
//  Created by mac on 2022/11/22.
//

import SwiftUI

struct FirstSettingNickNameView: View {
    @State var nickName = ""
    var body: some View {
        
        NavigationView(content: {
            VStack{
                
                Spacer()
                Text("닉네임을 입력해주세요").multilineTextAlignment(.leading)
                TextField("영어, 한글, 공백, 숫자의 조합으로 최대 15자까지 가능합니다", text: $nickName)
                    .padding()
                    .background(Color(uiColor: .secondarySystemBackground))
                
                //버튼 오른쪽 정렬할려면 Button에다가 multipleTextalignment 붙여봤자 소용 없다.
                HStack{
                    Spacer()
                    
                    NavigationLink(destination: FirstSettingSNSLinkView()){
                        
                        Image(systemName: "arrow.right")
                            .resizable()
                            .frame(width:30, height: 30)
                        
                    }
                }
                Spacer()
                
                
            }
        })
        
    }
}

struct FirstSettingNickNameView_Previews: PreviewProvider {
    static var previews: some View {
        FirstSettingNickNameView()
    }
}
