//
//  CoinDataService.swift
//  CryptoTracker
//
//  Created by mongy on 16/02/2023.
//

import Foundation
import Combine

class CoinDataService {
    @Published var allCoins: [CoinModel] = []
    var getCoinSubscrioption: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    private func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h")
        else {
            return
        }
        
        getCoinSubscrioption =
        NetworkingManager.getUrl(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink {
                NetworkingManager.handleSinkCompletion(completion: $0)
            } receiveValue: { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
                self?.getCoinSubscrioption?.cancel()
            }
    }
    
    
    
}
