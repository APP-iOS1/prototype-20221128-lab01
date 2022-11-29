//
//  WalletInfo.swift
//  GlaipDemo
//
//  Created by mac on 2022/11/06.
//

import Foundation
import Combine


class WalletInfo{
    
    static let shared = WalletInfo();
    var walletAddress: String = ""
    var nftInfo: Data!
    
    func setNFTInfo(_ address: String){
        let headers = [
            "accept": "application/json",
            //여기에는 moralis에서 만든 api key를 넣어줍니다.
            "X-API-Key": "jfIYc8snOlqvMYc5qHV52D378DXyWFr1EaTe06mYbA9MLKOjl87UXOoelaqEuyF2"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://deep-index.moralis.io/api/v2/\(address)/nft?chain=eth&format=hex")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        //세션 생성, 싱글톤 사용
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error)  in
            if (error != nil) {
                print(error as Any)
            } else {
                do{
                    //sleep(2)
                    //let httpResponse = response as? HTTPURLResponse
                    guard let data = data else {return}
                    self.nftInfo = data
                    print(type(of: self.nftInfo))
                    //print(String(data: data, encoding: .utf8)!)
                }
                
            }
            
        })
        //print(dataTask.response)
        dataTask.resume()
        
    }
}
