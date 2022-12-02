import SwiftUI

struct ChoiceImageView: View {
    let walletInfo: WalletInfo = WalletInfo.shared
    @State var imageUrls: [String] = []
    @Binding var choiceImageUrl : String
    @Binding var isPresented : Bool
    var body: some View {
        VStack{
            Text("이미지를 선택해주세요")
            VStack {
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 3)) {
                        ForEach(imageUrls, id:\.self) { imageUrl in
                            AsyncImage(url: URL(string:imageUrl)!){ image in
                                VStack{
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }
                                
                            }placeholder: {
                                ProgressView()
                            }.onTapGesture {
                                self.choiceImageUrl = imageUrl
                                self.isPresented = false
                            }
                        }
                        
                    }
                }
                
                
                
            }
        }.onAppear{
            if self.imageUrls.isEmpty{
                for metadata in walletInfo.metadatas{
                    imageUrls.append(metadata["image"] as! String)
                }
            }
            
        }
    }
}

struct ChoiceImageView_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceImageView(choiceImageUrl: .constant(""), isPresented: .constant(false))
    }
}
