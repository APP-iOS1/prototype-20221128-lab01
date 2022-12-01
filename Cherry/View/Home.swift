//
//  Home.swift
//  CustomCarousel
//
//  Created by 추현호 on 2022/11/09.
//


import SwiftUI

struct Home: View {
    @State var firstNaviLinkActive = false
    // current index
    @State var currentIndex: Int = 0
    @State var isShowingSheet : Bool = false
    @State var isShowingCamera: Bool = false
    @State var isShowingDetailSheet: Bool = false
    @State var isShowingDeleteAlert: Bool = false
    
    // 카드 디테일 버튼 동작 애니메이션
    @State var animate: Bool = false
    
    @State var detailButtonActivate: Bool = false
    
    @State var selectedAction: String = "수정하기"
    var actions = ["수정하기", "공유하기", "자세히보기", "삭제하기"]
    
    // 정상적인 방법은 setAverageColor()가 string([string] x) 값을 받아 backgroundColor를 바꿔줘야 한다
    // currentIndex에 맞춰서 색이 변해야 하는데 안됨. snapCarousel 파일을 이해 못 해서 그런 듯
    @State private var backgroundColor: Color = .clear
        
    // 임시방편 averageColor 버전 근데 이것도 안됨
    @State private var imageArr: [String] = ["NFTcard1", "NFTcard2", "NFTcard3", "NFTcard4"]
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                backgroundColor
                    .opacity(0.5)
//                TabView(selection: $currentIndex) {
//                    ForEach(posts.indices, id: \.self) { index in
//                        GeometryReader { proxy in
//                            Image(posts[index].frontImg)
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: proxy.size.width, height: proxy.size.height)
//                                .cornerRadius(1)
//                        }
//                        .ignoresSafeArea()
//                        .offset(y: -100)
//                    }
//                }
//                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//                .animation(.easeInOut, value: currentIndex)
//                .overlay(
//
//                    LinearGradient(colors: [
//
//                        Color.clear,
//                        Color.black.opacity(0.2),
//                        Color.white.opacity(0.4),
//                        Color.white,
//                        Color.white,
//                        Color.white,
//                    ], startPoint: .top, endPoint: .bottom)
//                )
//                .ignoresSafeArea()
                
                //posts..
                SnapCarousel(trailingSpace: getRect().height < 750 ? 100 : 150 ,index: $currentIndex, items: posts) { post in
                    
                    CardView(post: post)
                        .onAppear {
                            setAverageColor(image: imageArr)
                        }
                        
                    
                }
                .offset(y: getRect().height / 4)
                
                //
                //                TopItemView(isShowingCamera: $isShowingCamera, isShowingSheet: $isShowingSheet)
                //                    .position(x:200,y:10)
                HStack{
                    NavigationLink(destination: ChoiceNameCardTypeView(firstNaviLinkActive: $firstNaviLinkActive), isActive: $firstNaviLinkActive){
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width:50, height: 50)
                    }
                    
                }
                .padding(20)
                .offset(x:150, y:300)
            }
            .sheet(isPresented: $isShowingSheet,onDismiss: didDismiss) {
                MyMenuView(isShowingSheet: $isShowingSheet)
            }
            .sheet(isPresented: $isShowingCamera,onDismiss: didDismiss) {
                CameraQRView(isShowingCamera: $isShowingCamera)
        }
        }
        
        
        
    }
    @ViewBuilder
    func CardView(post: Post) -> some View {
        
        ZStack {
            
            //CardButtonView()
            GeometryReader { proxy in
                
                CardFlipView(frontImage:post.frontImg, backImage: post.backImg, width: proxy.size.width/1.0, height: proxy.size.height/1.0)
                    .frame(width: proxy.size.width, height: proxy.size.height / 4)
                    .shadow(radius: 10)
                    
            }
            
            // MARK: context menu가 담긴 버튼
            
            CardEditButtonView(isAnimating: $detailButtonActivate)
                .shadow(radius: 10)
                
        }
        
        .sheet(isPresented: $isShowingDetailSheet) {
            DetailView()
        }
        
    }
    
    
    func didDismiss(){
        //...
    }
    
    private func setAverageColor(image: [String]) {
        let uiColor = UIImage(named: image[currentIndex])?.averageColor ?? .clear
        backgroundColor = Color(uiColor)
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

// screen bounds
extension View {
    
    func getRect() -> CGRect {
        
        return UIScreen.main.bounds
    }
}
