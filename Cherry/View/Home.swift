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
    var body: some View {
        
        NavigationView {
            ZStack {
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
        
        VStack(spacing: 10) {
            
            //CardButtonView()
            GeometryReader { proxy in
                
                CardFlipView(frontImage:post.frontImg, backImage: post.backImg, width: proxy.size.width/1.3, height: proxy.size.height/1.3)
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .cornerRadius(25)
            }
            .padding(15)
            .cornerRadius(25)
            .frame(height: getRect().height / 2.5)
            
            // MARK: context menu가 담긴 버튼
            Button {
                
            } label: {
                Image(systemName: "line.3.horizontal.circle")
                    .font(.title2)
                    .foregroundColor(.gray)
            }
            .contextMenu {
                Button {
                    print("수정하기")
                } label: {
                    Text("수정하기")
                    Image(systemName: "paintbrush")
                }
                Button {
                    print("공유하기")
                } label: {
                    Text("공유하기")
                    Image(systemName: "paintbrush")
                }
                Button {
                    isShowingDetailSheet.toggle()
                } label: {
                    Text("자세히 보기")
                    Image(systemName: "paintbrush")
                }
                Divider()
                Button(role: .destructive) {
                    print("삭제하기")
                } label: {
                    Text("삭제하기")
                        .foregroundColor(.red)
                    Image(systemName: "paintbrush")
                }
            } // button
            .padding(EdgeInsets(top: -33, leading: 135, bottom: 0, trailing: 0))
            
            
        }.sheet(isPresented: $isShowingDetailSheet) {
            DetailView()
        }
    }
    
    
    func didDismiss(){
        //...
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
