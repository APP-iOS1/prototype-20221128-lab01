//
//  BackTemplate1.swift
//  Cherry
//
//  Created by mac on 2022/12/02.
//

import SwiftUI

struct BackTemplate1: View {
    
    @Binding var owner: String
    @Binding var description: String
    @Binding var properties: [String]
    @Binding var properties_description: [String]
    @Binding var additional_infos: [String]
    
    var body: some View {
        VStack{
            HStack{
                Text("owned by")
                Text(owner)
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
                    Text(description)
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
                        Text(properties[0])
                            .font(.footnote)
                        Text(properties_description[0])
                            .font(.footnote)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                    }
                    VStack{
                        Text(properties[1])
                            .font(.footnote)
                        Text(properties_description[1])
                            .font(.footnote)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                    }
                    VStack{
                        Text(properties[2])
                            .font(.footnote)
                        Text(properties_description[2])
                            .font(.footnote)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                    }
                }
            }
            VStack{
                HStack{
                    Image(systemName: "iphone.homebutton.circle")//여기다가 피커 달 예정
                    Text(additional_infos[0])
                        .font(.footnote)
                        .fontWeight(.light)
                        .padding(5)
                }
                HStack{
                    Image(systemName: "envelope.circle.fill")
                    Text(additional_infos[1])
                        .font(.footnote)
                        .fontWeight(.light)
                        .padding(5)
                }
                HStack{
                    Image(systemName: "link.circle")
                    Text(additional_infos[2])
                        .font(.footnote)
                        .fontWeight(.light)
                        .padding(5)
                }
            }
        }.frame(width: 300, height: 600)
    }
}

struct BackTemplate1_Previews: PreviewProvider {
    static var previews: some View {
        BackTemplate1(owner: .constant(""), description: .constant(""), properties: .constant([]), properties_description: .constant([]), additional_infos: .constant([]))
    }
}
