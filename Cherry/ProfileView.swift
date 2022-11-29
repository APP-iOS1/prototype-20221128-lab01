//
//  ProfileView.swift
//  GlaipDemo
//
//  Created by Mauricio Vazquez on 16/8/22.
//

import SwiftUI

struct ProfileView: View {
    let logoutAction: () -> Void
    let walletInfo: WalletInfo = WalletInfo.shared
    var images: [String] = ["baby_kongz", "uncle", "daydream"]
    @State var nfts: [MyNFTInfo] = []
    
    @State var currentIndex : Int = 0
    
    @State var currentTab = "Slide Show"
    @Namespace var animation
    
    var body: some View {
        VStack(spacing: 15) {
            Spacer()
            
            //Segment Control...
            HStack(spacing: 0){
                TabButton(title: "Slide Show", animation: animation, currentTab: $currentTab)
                TabButton(title: "List", animation: animation, currentTab: $currentTab)
                    .background(Color.black.opacity(0.04), in: RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
            }
            //Snap Carousel
            SnapCarousel(trailingSpace: 150, index: $currentIndex, items: nfts){ item in
                GeometryReader{ proxy in
                    let size = proxy.size
                    Image(item.name)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: size.width)
                        .cornerRadius(12)
                }
            }
            .padding(.vertical, 40)
            
            HStack(spacing: 10){
                ForEach(nfts.indices, id : \.self){index in
                    Circle()
                        .fill(Color.black.opacity(currentIndex == index ? 1 : 0.1))
                        .frame(width: 10, height: 10)
                        .scaleEffect(currentIndex == index ? 1.4 : 1)
                        .animation(.spring(), value: currentIndex == index)
                }
            }
            .padding(.bottom, 40)
        }
        .frame(maxWidth: .infinity, alignment: .top)
        .onAppear{
            for index in 0..<3{
                nfts.append(MyNFTInfo(name: images[index]))
            }
        }
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(logoutAction: {})
    }
}

//TabButton
struct TabButton: View{
    var title: String
    var animation: Namespace.ID
    @Binding var currentTab: String
    
    var body: some View{
        Button{
            withAnimation(.spring()){
                currentTab = title
            }
        }label:{
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(currentTab == title ? .white : .black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .background(
                    ZStack{
                        if currentTab == title{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.black)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                    })
        }
    }
}
