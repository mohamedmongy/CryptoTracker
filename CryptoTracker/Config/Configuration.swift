//
//  Configuration.swift
//  CryptoTracker
//
//  Created by mongy on 24/02/2023.
//

import Foundation

enum Configuration: String {
    
    // MARK: - Configurations
    
    case staging
    case production
    case release
    
    // MARK: - Current Configuration
    
    static let current: Configuration = {
        guard let rawValue = Bundle.main.infoDictionary?["config"] as? String else {
            fatalError("No Configuration Found")
        }
        
        guard let configuration = Configuration(rawValue: rawValue.lowercased()) else {
            fatalError("Invalid Configuration")
        }
        
        return configuration
    }()
    
    
    // MARK: - Base URL
    
    static var baseURL: URL {
        switch current {
        case .staging:
            return URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=12h")!
        case .production, .release:
            return URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h")!
        }
    }
    
    enum DarkSky {
        
        static let apiKey: String = {
            switch current {
            case .staging:
                return "123staging"
            case .production:
                return "456protduciton"
            case .release:
                return "789release"
            }
        }()
        
    }
}
