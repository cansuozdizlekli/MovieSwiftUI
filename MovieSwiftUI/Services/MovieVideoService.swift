//
//  MovieVideoService.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/17/24.
//

import Foundation
import Combine

class MovieVideoService {
    @Published var videoResult : [VideoResult]?
    var movieVideoSubscription: AnyCancellable?
    
    init(movieID: Int) {
        getMovieVideos(movieID: movieID)
    }

    private func getMovieVideos(movieID: Int) {
        movieVideoSubscription = NetworkManager.download(url: constructURL(for: .movieVideo(movieID: movieID)))
            .decode(type: Video.self, decoder: JSONDecoder())
            .map { $0.results ?? [] }
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedMovieVideos) in
                self?.videoResult = returnedMovieVideos
                self?.movieVideoSubscription?.cancel()
        })
    }
    
    private func constructURL(for endpoint: MovieEndpoint) -> URL {
        let urlWithParams = API.prepareUrl(withPath: endpoint.path)
        guard let urlWithApiKey = urlWithParams.addingApiKey() else {
                fatalError("API anahtarı eklenemedi.")
        }
        
        return urlWithApiKey
    }
    
}
