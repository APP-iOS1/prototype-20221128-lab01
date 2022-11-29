//
//  ContentView.swift
//  GlaipDemo
//
//  Created by Mauricio Vazquez on 15/8/22.
//

import SwiftUI
import Glaip

struct LoginView: View {
    @ObservedObject private var glaip: Glaip
    let walletInfo: WalletInfo = WalletInfo.shared
    
    init() {
        self.glaip = Glaip(
            title: "Glaip Demo App",
            description: "Demo app to demonstrate Web3 login",
            supportedWallets: [.Rainbow])
    }
    
    
    var body: some View {
        VStack {
            if glaip.userState == .unregistered {
                VStack {
                    HStack {
                        Image(systemName:"heart.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.red)
                        
                        Text("Cherry")
                            .font(.system(size: 40, weight: .bold))
                            .padding(5)
                            .foregroundColor(Color(.red))
                    }
                    
                    Text("Welcome to Cherry")
                        .font(.system(size: 25, weight: .semibold))
                        .padding(5)
                        .foregroundColor(Color("AccentColor"))
                    
                    Text("Web3 Non Fungible NameCard Application")
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("AccentColor"))
                }
                .padding()
                .padding(.bottom, 30)
                
                WalletButtonView(
                    title: "MetaMask",
                    action: {
                        glaip.loginUser(type: .MetaMask) { result in
                            switch result {
                            case .success(let user):
                                print("walletAddress:\(user.wallet.address)")
                                walletInfo.walletAddress = user.wallet.address
                                setNFTInfo_eth(user.wallet.address)
                            case .failure(let error):
                                print(error)
                            }
                        }
                    },
                    iconImage: Image("MetaMaskIcon")
                )
                .frame(width: 250)
                .padding(.leading)
                .padding(.trailing)
                
                WalletButtonView(
                    title: "Kaikas",
                    action: {
                        glaip.loginUser(type: .Rainbow) { result in
                            print(result)
                        }
                    },
                    iconImage: Image("RainbowWalletIcon")
                )
                .frame(width: 250)
                .padding(.top)
                .padding(.leading)
                .padding(.trailing)
            }
            else {
                FirstSettingNickNameView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
    
    func setNFTInfo_eth(_ address: String){
        let headers = [
            "accept": "application/json",
            //여기에는 moralis에서 만든 api key를 넣어줍니다.
            "X-API-Key": "jfIYc8snOlqvMYc5qHV52D378DXyWFr1EaTe06mYbA9MLKOjl87UXOoelaqEuyF2"
        ]
        
        let request_eth = NSMutableURLRequest(url: NSURL(string: "https://deep-index.moralis.io/api/v2/\(address)/nft?chain=eth&format=decimal&normalizeMetadata=false")! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 10.0)
        request_eth.httpMethod = "GET"
        request_eth.allHTTPHeaderFields = headers
        
        //세션 생성, 싱글톤 사용
        let session = URLSession.shared
        //sleep(2)
        let dataTask = session.dataTask(with: request_eth as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                do{
                    guard let data = data else {return}
                    // data
                    
                    if let json = try? jsonParsing(data){
                        //print("json: \(json)")
                        walletInfo.response = json
                        if json.result != nil{
                            walletInfo.result = json.result!
                            //print("walletInfo.result:\(walletInfo.result)")
                            for result in json.result!{
                                walletInfo.metadatas.append(stringToJson(result.metadata!))
                            }
                           
                        }
                    }
                    
                }
                
            }
            
        })
        //print(dataTask.response)
        dataTask.resume()
        
    }
    func jsonParsing(_ data: Data) -> Response? {
        do{
            let parsingData = try JSONDecoder().decode(Response.self, from: data)
            return parsingData
        }
        catch{
            return nil
        }
    }
    func stringToJson(_ metadata: String) -> Dictionary<String, Any>{
        var dicData: Dictionary<String, Any> = Dictionary()
        do {
            // 딕셔너리에 데이터 저장 실시
            dicData = try JSONSerialization.jsonObject(with: Data(metadata.utf8), options: []) as! [String:Any]
        } catch {
            print(error.localizedDescription)
        }
        return dicData
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
