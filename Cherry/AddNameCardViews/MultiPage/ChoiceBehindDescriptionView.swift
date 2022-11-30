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
    @State private var whoamI: String = ""
    @State private var interesting: String = ""
    @State private var mbti: String = ""
    @State private var phoneNumber: String = ""
    @State private var emailAddress: String = ""
    @State private var snsLink: String = ""
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
                VStack{
                    TextField("소개를 써주세요", text: $description, axis: .vertical)
                        .lineLimit(5, reservesSpace: true)
                        .textFieldStyle(.roundedBorder)
                }
            }
            
            VStack{
                HStack{
                    Image(systemName: "book.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Properties")
                    Spacer()
                }
                HStack{
                    VStack{
                        Text("I AM")
                            .font(.footnote)
                        TextField("역할", text: $whoamI)
                            .font(.footnote)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                    }
                    VStack{
                        Text("INTERSETE IN")
                            .font(.footnote)
                        TextField("흥미", text: $interesting)
                            .font(.footnote)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                    }
                    VStack{
                        Text("MBTI")
                            .font(.footnote)
                        TextField("MBTI", text: $mbti)
                            .font(.footnote)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                    }
                }
            }
            VStack{
                HStack{
                    Image(systemName: "iphone.homebutton.circle")
                    TextField("핸드폰 번호", text: $phoneNumber)
                        .font(.footnote)
                        .fontWeight(.light)
                        .padding(5)
                }
                HStack{
                    Image(systemName: "envelope.circle.fill")
                    TextField("이메일", text: $emailAddress)
                        .font(.footnote)
                        .fontWeight(.light)
                        .padding(5)
                }
                HStack{
                    Image(systemName: "link.circle")
                    TextField("SNS 주소", text: $snsLink)
                        .font(.footnote)
                        .fontWeight(.light)
                        .padding(5)
                }
            }
            NavigationLink("다음", destination: FinalCreatingStepView(firstNaviLinkActive: $firstNaviLinkActive))
        }.frame(width: 300, height: 600)
    }
}

struct ChoiceBehindDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceBehindDescriptionView(firstNaviLinkActive: .constant(true))
    }
}
