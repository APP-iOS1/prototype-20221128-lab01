//
//  MyProfileView.swift
//  Cherry
//
//  Created by 전근섭 on 2022/11/29.
//

import SwiftUI
import PhotosUI

struct MyProfileView: View {
    
    @State var selectedPage = "Wallet Activities"
//    var pages = ["Wallet Activities", "NFTs"]
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    var body: some View {
        VStack {
            HStack {
                Text("My Page")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color("MainColor"))
                
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
            
            VStack {
                ProfilePickerView2()
//                Picker("Choose a page", selection: $selectedPage) {
//                    ForEach(pages, id: \.self) {
//                        Text($0)
//
//                    }
//                }
//                .pickerStyle(.segmented)
//
//                switch selectedPage {
//                case "Wallet Activities" :
//                    ProfilePickerView1()
//                case "NFTs" :
//                    ProfilePickerView2()
//                default:
//                    ProfilePickerView1()
//                }
                
            }
            
            Spacer()
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
