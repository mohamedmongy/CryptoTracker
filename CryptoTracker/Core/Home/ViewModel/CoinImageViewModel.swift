//
//  CoinImageViewModel.swift
//  CryptoTracker
//
//  Created by mongy on 16/02/2023.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage?
    var isloading: Bool = true
    
    private var coinImageService: CoinImageService
    private var cancellables = Set<AnyCancellable>()
    private var imageUrlString: String
    
    init(urlString: String) {
        self.imageUrlString = urlString
        self.coinImageService = CoinImageService(urlString: urlString)
        bindToCoinImageService()
    }
    
    private func bindToCoinImageService() {
        coinImageService.$image
            .sink { [weak self] _ in
                self?.isloading = false
            } receiveValue: { returnedImage in
                self.image = returnedImage
            }.store(in: &cancellables)
    }
}
