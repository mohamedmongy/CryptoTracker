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
    var fileManager = LocalFileManager.instance
    var imageUrlString: String
    var coinId: String
    var folderName: String = "comcryptoTrackerapp"
    
    init(urlString: String, coinId: String) {
        imageUrlString = urlString
        self.coinId = coinId
        getCoinImage(urlString: urlString)
    }
    
    private func getCoinImage(urlString: String) {
        if let image = fileManager.get(image: coinId, at: folderName) {
            self.image = image
        } else {
            downloadImage(urlString: urlString)
        }
    }
    
    private func downloadImage(urlString: String) {
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
                guard
                    let self = self,
                    let downlaodedImage = returnedImage
                else {
                    return
                }
                self.image = downlaodedImage
                
                self.fileManager.save(rawData: downlaodedImage,
                                      with: self.coinId,
                                      at: self.folderName)
                
                self.getImageSubscrioption?.cancel()
            }
    }
}
