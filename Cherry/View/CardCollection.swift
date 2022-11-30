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
    
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            NavigationStack {
            HStack {
                Text("Card Collection")
                    .font(.largeTitle)
                
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                        .font(.largeTitle)
                        .foregroundColor(Color.black)
                    
                }
                
            }
            .padding()
            .background(Color("MainColor"))
            
            SearchBar(text: $searchText)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            
                ScrollView {
                    LazyVGrid(columns: columns) {
                        
                        ForEach(arr.filter{$0.contains(searchText) || searchText == ""}, id: \.self) { post in
                            
                            NavigationLink(destination: MyView(), label: {
                                
                                VStack(spacing: 0.1) {
                                    Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
                                        .cornerRadius(15)
                                        .frame(width: 170, height: 170)
                                        .padding()
                                    Text("\(post)")
                                }
                            })
                        }
                    }
                }
            }
        }
    }
}

struct CardCollection_Previews: PreviewProvider {
    static var previews: some View {
        CardCollection()
    }
}
