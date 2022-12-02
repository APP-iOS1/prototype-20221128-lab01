//
//  ChoiceBackDescriptionView.swift
//  Cherry
//
//  Created by mac on 2022/12/02.
//

import SwiftUI

struct ChoiceBackDescriptionView: View {
    /*명함 앞면 정보*/
    @Binding var nftCollectionName: String
    @Binding var nftName: String
    @Binding var nftNumber: String
    @Binding var imageUrl: String
    
    var frontTemplateType: Int
    
    @Binding var firstNaviLinkActive: Bool // NavigationStack의 호출에서부터 시작한 State 변수
    
    @State private var owner: String = ""
    @State private var description: String = ""
    @State private var properties: [String] = []
    @State private var properties_description: [String] = []
    @State private var additional_infos: [String] = []
    
    var body: some View {
        VStack{
            HStack{
                Text("owner로 표시될 텍스트를 입력해주세요")
                Spacer()
            }
            HStack{
                TextField("예) 80rian", text: $owner)
                Divider()
                Spacer()
            }
        }
        
        VStack{
            HStack{
                Text("자신을 표현해주세요(5줄 이하)")
                Spacer()
            }
            TextField("소개를 써주세요", text: $description, axis: .vertical)
                .lineLimit(5, reservesSpace: true)
                .textFieldStyle(.roundedBorder)
        }
        VStack{
            HStack{
                Text("세가지 키워드를 적어주세요")
                Spacer()
            }
            HStack{
                Text("속성1:")
                TextField("예) I AM", text:$properties[0])
                Divider()
                Spacer()
            }.padding(20)
            HStack{
                Text("속성2:")
                TextField("예) INTEREST IN", text:$properties[1])
                Divider()
                Spacer()
            }.padding(20)
            HStack{
                Text("속성3:")
                TextField("예) MBTI", text:$properties[2])
                Divider()
                Spacer()
            }.padding(20)
        }
        VStack{
            HStack{
                Text("키워드에 대한 자신을 표현해주세요")
                Spacer()
            }
            HStack{
                Text("속성1:")
                TextField("예) IOS PM", text:$properties_description[0])
                Divider()
                Spacer()
            }.padding(20)
            HStack{
                Text("속성2:")
                TextField("예) NFT", text:$properties_description[1])
                Divider()
                Spacer()
            }.padding(20)
            HStack{
                Text("속성3:")
                TextField("예) ESFJ", text:$properties_description[2])
                Divider()
                Spacer()
            }.padding(20)
        }
        VStack{
            HStack{
                Text("추가 정보를 입력해주세요")
                Spacer()
            }
            HStack{
                TextField("추가 정보", text: $additional_infos[0])
                Divider()
                Spacer()
            }
            HStack{
                TextField("추가 정보", text: $additional_infos[1])
                Divider()
                Spacer()
            }
            HStack{
                TextField("추가 정보", text: $additional_infos[2])
                Divider()
                Spacer()
            }
        }
        NavigationLink("다음", destination: FinalStep_MultiPageView(nftCollectionName:$nftCollectionName, nftName:$nftName, nftNumber:$nftNumber, imageUrl: $imageUrl, frontTemplateType: frontTemplateType, firstNaviLinkActive: $firstNaviLinkActive, owner: $owner, description: $description, properties: $properties, properties_description: $properties_description, additional_infos: $additional_infos))
    }
}
