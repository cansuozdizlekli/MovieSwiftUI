//
//  CastDataService.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/14/24.
//

import Foundation
import Combine

class CastDataService {
    @Published var cast : [Cast] = []

    var castSubscription: AnyCancellable?
    
    init(movieID: Int) {
        getCast(movieID: movieID)
    }

    
    private func getCast(movieID: Int) {
        
        castSubscription = NetworkManager.download(url: constructURL(for: .cast(movieID: movieID)))
            .decode(type: CastDetail.self, decoder: JSONDecoder())
            .map { $0.cast ?? []}
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedCast) in
                self?.cast = returnedCast
                self?.castSubscription?.cancel()
        })
    }
    
    private func constructURL(for endpoint: MovieEndpoint) -> URL {
        let parameters = [
                "language": "en-US"
        ]
                
        let urlWithParams = API.prepareUrl(withPath: endpoint.path).addingParameters(parameters: parameters)
        guard let urlWithApiKey = urlWithParams.addingApiKey() else {
                fatalError("API anahtarı eklenemedi.")
        }
        
        return urlWithApiKey
    }
}

