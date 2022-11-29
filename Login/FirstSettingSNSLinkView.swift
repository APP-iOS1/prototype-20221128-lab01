//
//  FirstSettingSNSLinkView.swift
//  Cherry
//
//  Created by mac on 2022/11/22.
//

import SwiftUI
import Glaip
struct FirstSettingSNSLinkView: View {
    
    @State var instagramLink: String = ""
    @State var twitterLink: String = ""
    @State var facebookLink: String = ""
    @State var linkedinLink: String = ""
    @State var isFinish: Bool = false
    var body: some View {
        
        VStack{
            if isFinish == false{
                HStack{
                    Image("2021 Twitter logo - blue")
                        .resizable()
                        .frame(width: 30, height: 30)
                    TextField("트위터 프로필 링크를 입력해주세요", text: $twitterLink)
                }
                HStack{
                    Image("instagram")
                        .resizable()
                        .frame(width: 30, height: 30)
                    TextField("인스타그램 프로필 링크를 입력해주세요", text: $instagramLink)
                }
                HStack{
                    Image("facebook")
                        .resizable()
                        .frame(width: 30, height: 30)
                    TextField("페이스북 프로필 링크를 입력해주세요", text: $facebookLink)
                }
                HStack{
                    Image("icons8-linkedin-circled-48")
                        .resizable()
                        .frame(width: 30, height: 30)
                    TextField("링크드인 프로필 링크를 입력해주세요", text: $linkedinLink)
                }
                HStack{
                    Spacer()
                    Button(action:{
                        isFinish.toggle()
                    }){
                        Image(systemName: "arrow.right")
                            .resizable()
                            .frame(width:30, height:30)
                    }
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

