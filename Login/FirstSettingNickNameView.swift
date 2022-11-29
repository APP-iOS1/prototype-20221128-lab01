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
                
                Text("닉네임을 입력해주세요").multilineTextAlignment(.leading)
                    .font(.title)
                    .padding(.vertical, 30)
                
                
                
                TextField("영어, 한글, 공백, 숫자의 조합으로 최대 15자까지 가능합니다", text: $nickName)
                    .padding()
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(10)
                    .frame(width: 400)
                
                Spacer()
                
                //버튼 오른쪽 정렬할려면 Button에다가 multipleTextalignment 붙여봤자 소용 없다.
                HStack{
                    
                    NavigationLink(destination: FirstSettingSNSLinkView()){
                        
                        Text("다음")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .frame(width:400, height: 60)
                            .background(Color("MainColor"))
                            .cornerRadius(10)
                            
                    }
                }
                
            }
        })
        
    }
}

struct FirstSettingNickNameView_Previews: PreviewProvider {
    static var previews: some View {
        FirstSettingNickNameView()
    }
}
