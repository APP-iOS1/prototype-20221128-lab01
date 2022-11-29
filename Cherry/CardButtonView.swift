//
//  ButtonView.swift
//  Cherry
//
//  Created by 박희경 on 2022/11/08.
//

import SwiftUI

struct CardButtonView: View {
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "pencil.circle")
            }
            Button {
                
            } label: {
                Image(systemName: "bookmark")
            }
            
            Button {
                
            } label: {
                Image(systemName: "paperplane")
            }

        }
        .foregroundColor(.white)
    }
}

struct CardButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CardButtonView()
    }
}
