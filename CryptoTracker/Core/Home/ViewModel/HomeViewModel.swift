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
    @Published var searchQuery: String = ""
    
    let coinService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        bindToSearchQueryTextFiled()
    }
    
    func bindToSearchQueryTextFiled() {
        $searchQuery
            .combineLatest($allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filteredCoins)
            .sink { [weak self] filteredCoins in
                self?.allCoins = filteredCoins
            }
            .store(in: &cancellables)
    }
    
    var filteredCoins =  { (_ query: String, _ startingCoins: [CoinModel]) -> [CoinModel] in
        if query.isEmpty {
            return startingCoins
        }
        
        return startingCoins.filter { coin in
            coin.name.lowercased().contains(query) ||
            coin.symbol.lowercased().contains(query) ||
            coin.id.lowercased().contains(query)
        }
    }
    
}
