//
//  CardCollection.swift
//  Cherry
//
//  Created by 전혜성 on 2022/11/30.
//

import SwiftUI

struct CardCollection: View {
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    var arr: [String] = ["모두보기", "그룹1", "그룹2", "그룹3"]
    var arrImage: [String] = ["group1", "group2", "group3", "group4", "group5", "group6", "group7", "group8","group9"]
    
    @State private var searchText = ""
    
    var body: some View {
        VStack {
//            NavigationStack {
            HStack {
                Text("Card Collection")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color("MainColor"))
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                        .font(.largeTitle)
                        .foregroundColor(Color("MainColor"))

                }
                
            }
            .padding()
                
            SearchBar(text: $searchText)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            
                ScrollView {
                    LazyVGrid(columns: columns) {
                        
                        ForEach(arr.filter{$0.contains(searchText) || searchText == ""}, id: \.self) { post in
                            
                            NavigationLink(destination: CardGroupDetail(), label: {
                                
                                VStack(spacing: 0.1) {
                                    Image(arrImage.randomElement()!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(30)
                                        .padding(10)
                                    Text("\(post)")
                                        .font(.headline)
                                }
                            })
                        }
                    }
                }
//            }
        }
    }
}

struct CardCollection_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CardCollection()
        }
    }
}
