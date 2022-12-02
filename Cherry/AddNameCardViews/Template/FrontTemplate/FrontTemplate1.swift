//
//  ChoiceFrontOnlyImageView.swift
//  Cherry
//
//  Created by mac on 2022/11/29.
//

import SwiftUI

struct FrontTemplate1: View {
    
    @Binding var nftCollectionName: String
    @Binding var nftName: String
    @Binding var nftNumber: String
    @Binding var imageUrl: String
    
    var body: some View {
        VStack{
            
            AsyncImage(url:URL(string: imageUrl)!){ image in
                VStack{
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }.padding(0)
            }placeholder: {
                ProgressView()
            }.padding(0)
            
            Spacer()
            HStack{
                Image(systemName: "checkmark.seal.fill")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.cyan)
                Text(nftCollectionName)
                    .font(.caption2)
                    .foregroundColor(.cyan)
                    .modifier(FittingFontSizeModifier())
                
                Spacer()
                HStack{ //MARK: 버튼 테두리 감싸는거 아직 해야함.
                    
                    Group{
                        Image(systemName: "arrow.clockwise")
                        Image(systemName: "square.and.arrow.up")
                        Image(systemName: "link")
                        Image(systemName: "ellipsis")
                    }.frame(width: 15, height: 15)
                }
                
                
            }
            Spacer()
            VStack{
                
                HStack{
                    Spacer()
                    Text(nftName)
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.trailing)
                        .modifier(FittingFontSizeModifier())
                }
                HStack{
                    Spacer()
                    Text(nftNumber)
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.trailing)
                        .modifier(FittingFontSizeModifier())
                }
                
                HStack{
                    Spacer()
                    Image("QRImage")
                        .resizable()
                        .frame(width: 75, height: 75)
                }
            }
            
            
            Spacer()
        }.frame(width: 250, height: 450)
    }
}
