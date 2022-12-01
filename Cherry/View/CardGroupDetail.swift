//
//  CardGroupDetail.swift
//  Cherry
//
//  Created by 박성민 on 2022/12/01.
//

import SwiftUI


struct CardGroupDetail: View {
    
    @State private var searchDetail = ""
    var body: some View {
        VStack{
            Text("그룹1")
                .font(.largeTitle)
                .bold()
                .foregroundColor(Color("MainColor"))
            SearchBar(text: $searchDetail)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))

//            Rectangle()
//                    .padding(.horizontal)
//                    .frame(height: 2)
//                    .foregroundColor(Color("MainColor"))
            ScrollView{
                Grid {
                    GridRow {
                        Image("NFTcard1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        

                        Image("NFTcard2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)

                    }
                    .padding(.bottom,10)
                    GridRow {
                        Image("NFTcard3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Image("NFTcard4")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .padding(.bottom,10)

                    GridRow {
                        Image("NFTcard5")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Image("NFTcard1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .padding(.bottom,10)

                    GridRow {
                        Image("NFTcard2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Image("NFTcard3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .padding(.bottom,10)

                    GridRow {
                        Image("NFTcard4")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)

                        Image("NFTcard5")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)

                    }
                    .padding(.bottom,10)

                }
            }
            .padding(.top,10)
        }
        .padding(.horizontal,10)
    }
}

struct CardGroupDetail_Previews: PreviewProvider {
    static var previews: some View {
        CardGroupDetail()
    }
}
