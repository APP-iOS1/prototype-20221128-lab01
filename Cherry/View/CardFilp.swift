//
//  ContentView.swift
//  CardFlip
//
//  Created by 추현호 on 2022/11/08.
//

import SwiftUI

//카드앞면
struct CardFront : View {
    var image:String

    //frontDegree, backDegree를 받아서 이미지의 rotation3DEffect에 넘겨줄 변수
    @Binding var degree : Double
    var width:CGFloat
    var height:CGFloat
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: width,height: height)
            .padding(15)
            .background(Color.white)
            .cornerRadius(25)
            .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
            
    } //y축으로만 돌리겠다
}

//카드 뒷면
struct CardBack : View {
    var image:String
    @Binding var degree : Double
    var width:CGFloat
    var height:CGFloat
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: width,height: height)
            .padding(15)
            .background(Color.white)
            .cornerRadius(25)
            .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

struct CardFlipView: View {
    var frontImage: String
    var backImage: String
    var width:CGFloat = 0.0
    var height:CGFloat = 0.0
    @State var backDegree = -90.0 //CardBack의 초기각도
    @State var frontDegree = 0.0 //CardFront의 초기각도
    @State var isFlipped = false
    let durationAndDelay : CGFloat = 0.3 //뒤집는 속도
    @State var showAlert: Bool = false //onLongPressed 시 경고창 나타내기 위한 불리언
    
    func flipCard() {
        isFlipped.toggle() //탭 시 토글로 상태 전환
        // 뒷면이 보이는 경우 - 앞면을 정면에서 중앙으로, 뒷면을 중앙에서 정면으로 돌림
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)) {
                backDegree = 0
            }
            // 앞면이 보이는경우 - 뒷면을 정면에서 중앙으로, 앞면을 중앙에서 정면으로 돌림
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)) {
                frontDegree = 0
            }
        }
    }
    
    // 추후 삭제 함수 추가 구현
    func sayYes() {
        print("삭제되었습니다")
    }
    
    //얘는 액션 없어도 됨
    func sayNo() {
        print("취소되었습니다")
    }
    
    var body: some View {
        
        let longPressGesture = LongPressGesture(minimumDuration: 4)
            .onEnded { _ in
                
            }
        ZStack {
            CardFront(image: frontImage, degree: $frontDegree, width: width, height: height)
            CardBack(image: backImage,degree: $backDegree, width: width, height: height)
        }.onTapGesture {
            flipCard()
        }
        
//        .onLongPressGesture(perform: {
//            showAlert = true }
//        })
////        .alert(isPresented: $showAlert) {
////            Alert(
////                title: Text("삭제"),
////                message: Text("이 명함을 지우시겠습니까?"),
////                primaryButton: .default(
////                    Text("네"),
////                    action: sayYes
////                ),
////                secondaryButton: .destructive(
////                    Text("아니오"),
////                    action: sayNo
////                )
////            )
//        }
//
    }
        
}


struct CardFlipView_Previews: PreviewProvider {
    static var previews: some View {
        CardFlipView(frontImage:"", backImage: "")
    }
}

