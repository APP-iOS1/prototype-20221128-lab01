//
//  ChoiceFrontImageNTextView.swift
//  Cherry
//
//  Created by mac on 2022/11/29.
//

import SwiftUI

/*
 for metadata in walletInfo.metadatas{
 var temp : Dictionary<String, String> = Dictionary<String, String>()
 if let name = metadata["name"] as? String{
 print("metadata[name]: \(name) is String!")
 temp["name"] = name
 
 }else{
 print("metadata[name]:  is not String")
 }
 if let url = metadata["image"] as? String{
 if(url.hasPrefix("ipfs")){
 let startIdx: String.Index = url.index(url.startIndex, offsetBy: 7)
 
 var result = String(url[startIdx...])
 let ipfsUrl = "https://ipfs.io/ipfs/" +  result
 temp["image"] = ipfsUrl
 print("ipfsUrl: \(ipfsUrl)")
 }else{
 temp["image"] = url
 }
 }else{
 print("metadata[image] is not String")
 }
 if let description = metadata["description"] as? String{
 print("metadata[description]: \(description) is String!")
 temp["description"] = description
 }else{
 print("metadata[description] is not String")
 }
 metadataInfo.append(temp)
 }
 */
struct ChoiceFrontImageNTextView: View {
    @Binding var firstNaviLinkActive: Bool

    @State private var nftCollectionName: String = ""
    @State private var nftName: String = ""
    @State private var nftNumber: String = ""
    var body: some View {
        VStack{
            Image("image-choiceImage")
                .resizable()
                .frame(width: 300, height: 300)
            HStack{
                Image(systemName: "checkmark.seal.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.cyan)
                TextField("NFT 컬렉션 이름", text: $nftCollectionName)
                    .frame(width: 150, height: 30)
                    .foregroundColor(.cyan)
                    .modifier(FittingFontSizeModifier())
                
                Spacer()
                HStack{ //MARK: 버튼 테두리 감싸는거 아직 해야함.
                    Image(systemName: "arrow.clockwise")
                    Image(systemName: "square.and.arrow.up")
                    Image(systemName: "link")
                    Image(systemName: "ellipsis")
                }
                
                
            }
            HStack{
                VStack{
                    TextField("NFT이름", text: $nftName)
                        .frame(width: 300, height: 30)
                        .font(.largeTitle)
                        .multilineTextAlignment(.trailing)
                        .modifier(FittingFontSizeModifier())
                    TextField("NFT번호", text: $nftNumber)
                        .frame(width: 300, height: 30)
                        .font(.largeTitle)
                        .multilineTextAlignment(.trailing)
                        .modifier(FittingFontSizeModifier())
                    HStack{
                        Spacer()
                        Image("QRImage")
                            .resizable()
                            .frame(width: 75, height: 75)
                    }
                }
                Spacer()
            }
            NavigationLink("다음", destination: FinalCreatingStepView(firstNaviLinkActive: $firstNaviLinkActive))
                
            
        }.frame(width: 300)
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
struct ChoiceFrontImageNTextView_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceFrontImageNTextView(firstNaviLinkActive: .constant(true))
    }
}
