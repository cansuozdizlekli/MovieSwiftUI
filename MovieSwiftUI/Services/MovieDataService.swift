//
//  MovieDataService.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/8/24.
//

import Foundation
import Combine

class MovieDataService {
    @Published var nowShowingMovies: [Results] = []
    
    var movieSubscription: AnyCancellable?
    
    init() {
        getNowPlayingMovies(page: 1) // Initial fetch
    }
    
    func getNowPlayingMovies(page: Int) {
        movieSubscription = NetworkManager.download(url: constructURL(for: .nowPlaying, page: page))
            .decode(type: Movie.self, decoder: JSONDecoder())
            .map { $0.results ?? [] }
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedMovies) in
                self?.nowShowingMovies.append(contentsOf: returnedMovies)
                self?.movieSubscription?.cancel()
            })
    }
    
    private func constructURL(for endpoint: MovieEndpoint, page: Int) -> URL {
        let parameters = [
            "page": "\(page)"
        ]
        
        let urlWithParams = API.prepareUrl(withPath: endpoint.path).addingParameters(parameters: parameters)
        guard let urlWithApiKey = urlWithParams.addingApiKey() else {
            fatalError("API anahtarı eklenemedi.")
        }
        
        return urlWithApiKey
    }
}


