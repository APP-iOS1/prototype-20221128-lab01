//
//  WalletInfo.swift
//  GlaipDemo
//
//  Created by mac on 2022/11/06.
//

import Foundation
import Combine


class WalletInfo{ // 지갑의 주소, 그리고 moralis api를 사용해서 지갑의 정보를 받는 곳
    
    static let shared = WalletInfo(); // Singleton 패턴 사용₩
    var walletAddress: String = "" //지갑 주소
    var response: Response = Response()
    var result: [Result] = [] // response의 Result를 저장하는 곳
    var metadatas: [Dictionary<String, Any>] = []
}

