//
//  ChoiceFrontTextView.swift
//  Cherry
//
//  Created by mac on 2022/12/02.
//

import SwiftUI
//텍스트 들을 설정하는 뷰.
struct ChoiceFrontInfo_SinglePage: View {
    
    //다음 뷰로 넘겨주기 위한 nft의 정보들
    @State private var nftCollectionName: String = ""
    @State private var nftName: String = ""
    @State private var nftNumber: String = ""
    @State private var imageUrl: String = "" // imageUrl
    var frontTemplateType: Int
    
    @State private var isPresented: Bool = false // image를 선택하기 위한 sheet를 보여주기 위한 스테이트 변수
    
    
    @Binding var firstNaviLinkActive: Bool // NavigationStack의 호출에서부터 시작한 State 변수
    
    
    var body: some View {
        ScrollView {
            VStack{
                HStack{
                    Text("이미지 선택")
                    Spacer()
                    Button("변경"){
                        isPresented.toggle()
                    }.sheet(isPresented: $isPresented){
                        ChoiceImageView(choiceImageUrl: $imageUrl, isPresented: $isPresented)
                    }
                }
                .padding()
                
                VStack{
                    if(imageUrl == ""){
                        Button("choice NFT"){
                            isPresented.toggle()
                        }.sheet(isPresented: $isPresented){
                            ChoiceImageView(choiceImageUrl: $imageUrl, isPresented: $isPresented)
                        }
                    }else{
                        AsyncImage(url:URL(string: imageUrl)!){ image in
                            VStack{
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            }
                        }placeholder: {
                            ProgressView()
                        }
                    }
                }.frame(width: 250, height: 250).padding(0)
                
                VStack {
                    HStack {
                        Text("nft Collection 이름")
                        Spacer()
                    }
                    
                    HStack{
                        TextField("예) DADAZ", text: $nftCollectionName)
                            .padding(5)
                            .padding(.horizontal, 5)
                            .background(Color(uiColor: .secondarySystemBackground))
                            .cornerRadius(10)
                        
                    }
                    
                    Divider()
                    
                    HStack{
                        Text("nft 이름")
                        Spacer()
                    }
                    HStack{
                        TextField("예) Run Away", text: $nftName)
                            .padding(5)
                            .padding(.horizontal, 5)
                            .background(Color(uiColor: .secondarySystemBackground))
                            .cornerRadius(10)
                        
                    }
                    
                    Divider()
                    
                    HStack{
                        Text("nft 번호")
                        Spacer()
                    }
                    
                    HStack{
                        TextField("예) #-181", text: $nftNumber)
                            .padding(5)
                            .padding(.horizontal, 5)
                            .background(Color(uiColor: .secondarySystemBackground))
                            .cornerRadius(10)
                        
                    }
                    
                    Divider()
                }
                .padding()
            }
            
            NavigationLink("다음", destination: FinalStep_SinglePageView(nftCollectionName: $nftCollectionName, nftName: $nftName, nftNumber: $nftNumber, imageUrl: $imageUrl, frontTemplateType: frontTemplateType, firstNaviLinkActive: $firstNaviLinkActive))
        }
        
    }
}
struct ChoiceFrontInfoView_Previews: PreviewProvider{
    static var previews: some View{
        ChoiceFrontInfo_SinglePage(frontTemplateType: 1, firstNaviLinkActive: .constant(true))
    }
}

