//
//  NetworkingManager.swift
//  CryptoTracker
//
//  Created by mongy on 16/02/2023.
//

import Foundation
import Combine

class NetworkingManager {
   
    enum NetworkingError: LocalizedError {
        case badUrlResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case let .badUrlResponse(url):
                return "[🔥] Bad Response From URL: \(url)"
            case .unknown:
                return "[⚠️] UNKnown Error Occured"
            }
        }
        
    }
    
    
    static func getUrl(url: URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global())
            .tryMap({
                try handleResponse(output: $0, url: url)
            })
            .eraseToAnyPublisher()
    }
    
    static func handleResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badUrlResponse(url: url)
        }
        return output.data
    }
    
    static func handleSinkCompletion(completion:  Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let err):
            print(err.localizedDescription)
        }
    }
    
    
}
