//
//  FinalCreatingStepView.swift
//  Cherry
//
//  Created by mac on 2022/11/29.
//

import SwiftUI

struct FinalCreatingStepView: View {                                                                                                                                                                                                                                                                                                 
    @Binding var stack: NavigationPath

    var body: some View {
        Button("처음으로 돌아가기"){
            while(!stack.isEmpty){
                stack.removeLast()
            }
        }
    }
}

struct FinalCreatingStepView_Previews: PreviewProvider {
    static var previews: some View {
        FinalCreatingStepView(stack: Binding.constant(NavigationPath()))
    }
}
