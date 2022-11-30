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
        Button(action: {
            firstNaviLinkActive = false
        }, label: {
            Text("Main으로 돌아가기")
                .foregroundColor(Color.white)
                .frame(width: 100, height: 60, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color.purple))
        })
    }
}

struct FinalCreatingStepView_Previews: PreviewProvider {
    static var previews: some View {
        FinalCreatingStepView(firstNaviLinkActive: .constant(true))
    }
}
