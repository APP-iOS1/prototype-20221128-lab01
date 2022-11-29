import SwiftUI
struct TopItemView: View {
    @Binding var isShowingCamera:Bool
    @Binding var isShowingSheet : Bool
    var body: some View {
        HStack(alignment: .top) {
            Button {
                isShowingSheet = true
            } label: {
                Image(systemName: "line.3.horizontal")
            }.foregroundColor(.white)
                .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 0))
            
            Spacer()
            Text("Cherry")
                .font(.title3)
                .fontWeight(.bold)
            Spacer()
            
            Button {
                isShowingCamera = true
            } label: {
                Image(systemName: "qrcode.viewfinder")
            }.foregroundColor(.white)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30))
//            NavigationLink(destination: CameraQRView()) {
//                Image(systemName: "plus")
//            }

            
        } // hstack
        .foregroundColor(.white)
        
    }
}

