//
//  testView.swift
//  Cherry
//
//  Created by 박희경 on 2022/11/10.
//

import SwiftUI

struct GestureView: View {
    @State private var counter: Int = 0
    @State private var timer: Timer?
    @State var islongPressed = false
    

    var body: some View {
        let longPressGesture = LongPressGesture(minimumDuration: 0.2).onEnded { _ in
            print("long press")
            self.islongPressed = true
            //or fastforward has started to start the timer
            self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
                self.counter += 1
            })
        }
        return VStack {
            Text("(counter)")
                .font(.largeTitle)
                .fontWeight(.heavy)

            Button(action: {
                print("tap")
                if(self.islongPressed){
                    //this tap was caused by the end of a longpress gesture, so stop our fastforwarding
                    self.islongPressed.toggle()
                    self.timer?.invalidate()

                } else {
                    //just a regular tap
                    self.counter += 1

                }
            }, label: {
                Image(systemName: self.islongPressed ? "chevron.right.2": "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)

            })
            .simultaneousGesture(longPressGesture)
        }
    }
}

struct GestureView_Previews: PreviewProvider {
    static var previews: some View {
        GestureView()
    }
}
