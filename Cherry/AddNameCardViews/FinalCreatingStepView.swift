//
//  FinalCreatingStepView.swift
//  Cherry
//
//  Created by mac on 2022/11/29.
//

import SwiftUI

struct FinalCreatingStepView: View {
    @Binding var firstNaviLinkActive: Bool

    var body: some View {
        VStack{
            Text("명함 생성이 완료되었습니다.")
                .font(.largeTitle)
            Button(action: {
                firstNaviLinkActive = false
            }, label: {
                Text("홈으로 돌아가기")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .frame(width: 150, height: 60, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color("MainColor")))
            })
        }
    }
}

struct FinalCreatingStepView_Previews: PreviewProvider {
    static var previews: some View {
        FinalCreatingStepView(firstNaviLinkActive: .constant(true))
    }
}
