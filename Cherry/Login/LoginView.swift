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
                        Image("WhiteLabelIcon")
                            .resizable()
                            .frame(width: 50, height: 50)
                        
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
                                `walletInfo`.walletAddress = user.wallet.address
                                `walletInfo`.setNFTInfo(user.wallet.address)
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
                ProfileView(logoutAction: {
                    glaip.userState = .unregistered
                    glaip.logout()
                })
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
    
    
}
