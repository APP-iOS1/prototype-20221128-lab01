//
//  FinalStep_SinglePageView.swift
//  Cherry
//
//  Created by mac on 2022/12/02.
//

import SwiftUI

struct FinalStep_SinglePageView: View {
    /*명함 앞면 정보*/
    @Binding var nftCollectionName: String
    @Binding var nftName: String
    @Binding var nftNumber: String
    @Binding var imageUrl: String
    
    var frontTemplateType: Int
    
    @Binding var firstNaviLinkActive: Bool // NavigationStack의 호출에서부터 시작한 State 변수
    var body: some View {
        VStack{
            if frontTemplateType == 1{
                FrontTemplate1(nftCollectionName: $nftCollectionName, nftName: $nftName, nftNumber: $nftNumber, imageUrl: $imageUrl).border(.black)
            }else if frontTemplateType == 2{
                FrontTemplate2(nftCollectionName: $nftCollectionName, nftName: $nftName, nftNumber: $nftNumber, imageUrl: $imageUrl)
            }else{
                
            }
            Spacer()
            Button(action: {
                firstNaviLinkActive = false
            }, label: {
                Text("Main으로 돌아가기")
                    .foregroundColor(Color.white)
                    .frame(width: 100, height: 60, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color.purple))
            })
            Spacer()
        }
    }
}

