//
//  MovieDataService.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/8/24.
//

import Foundation
import Combine

class MovieDataService {
    @Published var nowShowingMovies : [Results] = []

    var movieSubscription: AnyCancellable?
    
    init() {
        getNowPlayingMovies()
    }

    
    private func getNowPlayingMovies() {
        
        movieSubscription = NetworkManager.download(url: constructURL(for: .nowPlaying))
            .decode(type: Movie.self, decoder: JSONDecoder())
            .map { $0.results ?? [] }
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedMovies) in
                self?.nowShowingMovies = returnedMovies
                self?.movieSubscription?.cancel()
        })
    }
    
    
    private func constructURL(for endpoint: MovieEndpoint) -> URL {
        let parameters = [
                "page": "\(1)",
                "language": "en-US"
        ]
                
        let urlWithParams = API.prepareUrl(withPath: endpoint.path).addingParameters(parameters: parameters)
        guard let urlWithApiKey = urlWithParams.addingApiKey() else {
                fatalError("API anahtarı eklenemedi.")
        }
        
        return urlWithApiKey
    }
}


