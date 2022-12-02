//
//  ChoiceFrontImageNTextView.swift
//  Cherry
//
//  Created by mac on 2022/11/29.
//

import SwiftUI
struct FrontTemplate2: View {
    @Binding var nftCollectionName: String
    @Binding var nftName: String
    @Binding var nftNumber: String
    @Binding var imageUrl: String
    
    var body: some View {
        VStack{
            
            Spacer()
            HStack{
                Spacer()
                VStack{
                    HStack{
                        Spacer()
                        Text(nftCollectionName)
                            .font(.largeTitle)
                    }
                    //.position(x: 150, y:450)
                    HStack{
                        Spacer()
                        Text(nftName)
                            .multilineTextAlignment(.trailing)
                            .font(.title2)
                    }
                    //.position(x: 150, y:480)
                    HStack{
                        Spacer()
                        Text(nftNumber)
                            .multilineTextAlignment(.trailing)
                            .font(.title2)
                    }
                    //.position(x: 150, y:500)
                    HStack{
                        Spacer()
                        Image("qr-code-for-scanning-free-vector")
                            .resizable()
                            .frame(width: 35, height: 35)
                    }
                    //.position(x:260, y: 550)
                }
            }
                
            
        }.frame(width: 250, height: 400)
            .background(
                AsyncImage(url:URL(string: imageUrl)!){ image in
                    VStack{
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }.padding(0)
                }placeholder: {
                    ProgressView()
                }
            ).clipped()
    }
}

struct FittingFontSizeModifier: ViewModifier{
    func body(content: Content) -> some View{
        content
            .font(.system(size: 20))
            .minimumScaleFactor(0.001)
    }
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct FrontTemplate2_Preview: PreviewProvider {
    static var previews: some View {
        FrontTemplate2(nftCollectionName: .constant(""), nftName: .constant(""), nftNumber: .constant(""), imageUrl: .constant("https://cdn.discordapp.com/attachments/1043032747112923166/1047750509026615356/unknown.png"))
    }
}
