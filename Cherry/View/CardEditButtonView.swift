//
//  CardEditButtonView.swift
//  Cherry
//
//  Created by 전근섭 on 2022/12/01.
//

import SwiftUI

struct CardEditButtonView: View {
    // MARK:- variables
    @Binding var isAnimating: Bool
    
    // MARK:- views
    var body: some View {
        ZStack {
            
            ZStack {
                CardEditButtExpandingView(expand: $isAnimating, direction: .bottom, symbolName: "trash")
                CardEditButtExpandingView(expand: $isAnimating, direction: .left, symbolName: "doc.text")
                CardEditButtExpandingView(expand: $isAnimating, direction: .top, symbolName: "square.and.arrow.up")
                CardEditButtExpandingView(expand: $isAnimating, direction: .right, symbolName: "magnifyingglass")
                
                Image(systemName: "plus")
                    .font(.system(size: 30, weight:  self.isAnimating ? .regular : .semibold, design: .rounded))
                    .foregroundColor(self.isAnimating ? Color.white : Color.gray)
                    .rotationEffect(self.isAnimating ? .degrees(45) : .degrees(0))
                    .scaleEffect(self.isAnimating ? 3 : 1)
                    .opacity(self.isAnimating ? 0.5 : 1)
                    .animation(Animation.spring(), value: isAnimating)
                    .onTapGesture {
                        self.isAnimating.toggle()
                    }
            }
            .frame(height: 200)
            
        }
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        CardEditButtonView(isAnimating: .constant(false))
    }
}

enum ExpandDirection {
    case bottom
    case left
    case right
    case top
    
    var offsets: (CGFloat, CGFloat) {
        switch self {
        case .bottom:
            return (12, 42)
        case .left:
            return (-42, 12)
        case .top:
            return (-12, -42)
        case .right:
            return (42, -12)
        }
    }
    
    var containerOffset: (CGFloat, CGFloat) {
        switch self {
        case .bottom:
            return (18, 18)
        case .left:
            return (-18, 18)
        case .top:
            return (-18, -18)
        case .right:
            return (18, -18)
        }
    }
}

