//
//  TestView.swift
//  Cherry
//
//  Created by 전근섭 on 2022/11/30.
//

import SwiftUI

struct TestView: View {
    
    @State private var backgroundColor: Color = .clear
    @State private var currentIndex = 0

    // Scale Gesture
    @State private var currentAmount: CGFloat = 0
    @State private var finalAmount: CGFloat = 1

    // Drag Gesture
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    @GestureState private var dragOffset = CGSize.zero

    private var images: [String] = ["NFTcard1",
                                   "NFTcard2",
                                   "NFTcard3",
                                   "NFTcard4",
                                   "NFTcard5",
                                    ]
    var body: some View {
        // a drag gesture that updates offset and isDragging as it moves around


        return GeometryReader { geometry in
            Image(self.images[self.currentIndex])
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width * 0.8, height: geometry.size.width * 0.8)
                .clipped()
                .cornerRadius(10)
                .shadow(radius: 10)
                .offset(x: self.offset.width + self.dragOffset.width,
                        y: self.offset.height + self.dragOffset.height)
                .scaleEffect(self.currentAmount + self.finalAmount)
                .onTapGesture {
                    if (self.currentIndex == self.images.count - 1) {
                        self.currentIndex = 0
                    } else {
                        self.currentIndex = min(self.currentIndex + 1, self.images.count - 1)
                    }

                    self.setAverageColor()
                }
        }
        .background(backgroundColor)
        .onAppear {
            self.setAverageColor()
        }
        .edgesIgnoringSafeArea(.all)
    }

    private func setAverageColor() {
        let uiColor = UIImage(named: images[currentIndex])?.averageColor ?? .clear
        backgroundColor = Color(uiColor)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
