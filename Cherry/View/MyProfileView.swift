import SwiftUI
import PhotosUI

struct MyProfileView: View {
    let walletInfo: WalletInfo = WalletInfo.shared
    
    @State var imageUrls: [String] = []
    @State var selectedPage = "Wallet Activities"
    //    var pages = ["Wallet Activities", "NFTs"]
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    
    
    
    
    var body: some View {
        VStack {
            HStack {
                Text("MY")
                    .font(.system(size: 45))
                
                Spacer()
                
                HStack(spacing: 15) {
                    toolBarButton(image: "bell")
                    toolBarButton(image: "gearshape")
                    toolBarButton(image: "square.and.arrow.up")
                }
                .font(.system(size: 30))
            }
            
            HStack {
                
                PhotosPicker(
                    selection: $selectedItem,
                    matching: .images,
                    photoLibrary: .shared()) {
                        ZStack {
                            Image("MetaMaskIcon")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .padding(9)
                                .background(Color.secondary)
                                .clipShape(Circle())
                            
                            if let selectedImageData,
                               let uiImage = UIImage(data: selectedImageData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .padding(9)
                                    .background(Color.secondary)
                                    .clipShape(Circle())
                            }
                        }
                        
                    }
                    .onChange(of: selectedItem) { newItem in
                        Task {
                            // Retrieve selected asset in the form of Data
                            if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                selectedImageData = data
                            }
                        }
                    }
                
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("EN ❤️ LGC")
                        .font(.title)
                    
                    profileDetailButton(text: "Set ENS")
                    profileDetailButton(text: "주소")
                    profileDetailButton(text: "계좌")
                    
                }
                .padding(.leading, 20)
                
                Spacer()
            }
            
            Divider()
            
            HStack {
                Image("2021 Twitter logo - blue")
                    .resizable()
                    .frame(width: 40, height: 40)
                
                Text("트위터 주소 등등")
            }
            .padding()
            ProfilePickerView2()
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
                                VStack{
                                    Image(systemName: "photo")
                                        .imageScale(.large)
                                        .frame(width: 110, height: 110)
                                    
                                    Text("image broken")
                                }
                            }
                        }
                        
                    }
                }
                
                
                
            }
            
            Spacer()
        }
        .onAppear{
            if self.imageUrls.isEmpty{
                for metadata in walletInfo.metadatas{
                    imageUrls.append(metadata["image"] as! String)
                }
            }
            
        }
        .padding(10)
    }
    
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}

struct toolBarButton: View {
    
    var image: String = ""
    
    var body: some View {
        
        Button {
            
        } label: {
            Image(systemName: "\(image)")
        }
    }
}

struct profileDetailButton: View {
    
    var text: String = ""
    
    var body: some View {
        Button {
            
        } label: {
            Text("\(text)")
                .font(.headline)
        }
    }
}
