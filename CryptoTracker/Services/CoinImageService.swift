//
//  CoinImageService.swift
//  CryptoTracker
//
//  Created by mongy on 16/02/2023.
//

import Foundation
import Combine
import SwiftUI

class CoinImageService {
    @Published var image: UIImage?
    var getImageSubscrioption: AnyCancellable?
    
    init(urlString: String) {
        getCoinImage(urlString: urlString)
    }
    
    private func getCoinImage(urlString: String) {
        guard let url = URL(string: urlString)
        else {
            return
        }
        
        getImageSubscrioption = NetworkingManager.getUrl(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main)
            .sink {
                NetworkingManager.handleSinkCompletion(completion: $0)
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
                self?.getImageSubscrioption?.cancel()
            }
    }
}
