//
//  HomeViewModel.swift
//  CryptoTracker
//
//  Created by mongy on 15/02/2023.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    let coinService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        bindToCoinService()
    }
    
    private func bindToCoinService() {
        coinService.$allCoins
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }.store(in: &cancellables)
    }
}
