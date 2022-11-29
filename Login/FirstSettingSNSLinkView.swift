//
//  FirstSettingSNSLinkView.swift
//  Cherry
//
//  Created by mac on 2022/11/22.
//

import SwiftUI
import Glaip
struct FirstSettingSNSLinkView: View {
    
    @State var instagramLink: String = "https://www.instagram.com/"
    @State var twitterLink: String = "https://twitter.com/"
    @State var facebookLink: String = "https://facebook.com/"
    @State var linkedinLink: String = "https://www.linkedin.com/in/"
    @State var isFinish: Bool = false
    var body: some View {
        
        VStack {
            if isFinish == false{
                
                Text("주소 옆에 계정을 적어주세요")
                    .font(.title)
                
                HStack {
                    Image("2021 Twitter logo - blue")
                        .resizable()
                        .frame(width: 40, height: 40)
                    
//                    Text("트위터")
//
//                    Spacer()
//
//                    Button {
//
//                    } label: {
//                        Text("연결하기")
//                            .foregroundColor(.white)
//                            .padding()
//                            .background(Color.pink)
//                            .cornerRadius(10)
//                    }

                    TextField("트위터 프로필 링크를 입력해주세요", text: $twitterLink)
                        .padding(10)
                        .font(.headline)
                        .background(Color(uiColor: .secondarySystemBackground))
                        .cornerRadius(10)
                }
                .padding(7)
                
                HStack{
                    Image("instagram")
                        .resizable()
                        .frame(width: 40, height: 40)
                    
                    TextField("인스타그램 프로필 링크를 입력해주세요", text: $instagramLink)
                        .padding(10)
                        .font(.headline)
                        .background(Color(uiColor: .secondarySystemBackground))
                        .cornerRadius(10)
                }
                .padding(7)
                
                HStack{
                    Image("facebook")
                        .resizable()
                        .frame(width: 40, height: 40)
                    
                    TextField("페이스북 프로필 링크를 입력해주세요", text: $facebookLink)
                        .padding(10)
                        .font(.headline)
                        .background(Color(uiColor: .secondarySystemBackground))
                        .cornerRadius(10)
                }
                .padding(7)
                
                HStack{
                    Image("icons8-linkedin-circled-48")
                        .resizable()
                        .frame(width: 40, height: 40)
                    
                    TextField("링크드인 프로필 링크를 입력해주세요", text: $linkedinLink)
                        .padding(10)
                        .font(.headline)
                        .background(Color(uiColor: .secondarySystemBackground))
                        .cornerRadius(10)
                }
                .padding(7)
                
                Spacer()
                
                HStack{
                    Spacer()
                    Button(action:{
                        isFinish.toggle()
                    }){
                        Text("다음")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .frame(width:400, height: 60)
                            .background(Color("MainColor"))
                            .cornerRadius(10)
                    }
                    Spacer()
                }
            }else{
                ContentView(logoutAction: {})
            }
        }
        
    }
}

struct FirstSettingSNSLinkView_Previews: PreviewProvider {
    static var previews: some View {
        FirstSettingSNSLinkView()
    }
}

