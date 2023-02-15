//
//  HomeViewModel.swift
//  CryptoTracker
//
//  Created by mongy on 15/02/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.allCoins = [DeveloperPreview.instance.coin,
                        DeveloperPreview.instance.coin,
                        DeveloperPreview.instance.coin,
                        DeveloperPreview.instance.coin,
                        DeveloperPreview.instance.coin]
            
            self.portfolioCoins = [DeveloperPreview.instance.coin,
                              DeveloperPreview.instance.coin]
        })
    }
}
