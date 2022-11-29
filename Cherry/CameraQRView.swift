//
//  CameraQRView.swift
//  Cherry
//
//  Created by 허두영 on 2022/11/09.
//

import SwiftUI

struct CameraQRView: View {
    @Binding var isShowingCamera:Bool
    var body: some View {
        AsyncImage(url: URL(string: "https://media.discordapp.net/attachments/1039080936849014816/1039696794868789248/IMG_5392.png?width=317&height=686")) { image in
            image
                .resizable()
                .frame(width: 380, height: 750)
                .aspectRatio(contentMode: .fit)
            
        } placeholder: {
            Color.gray
        }.padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
    }
}
//
//struct CameraQRView_Previews: PreviewProvider {
//    static var previews: some View {
//        CameraQRView()
//    }
//}
