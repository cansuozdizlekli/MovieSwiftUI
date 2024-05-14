//
//  MovieDetailService.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/13/24.
//

import Foundation
import Combine

class MovieDetailService {
    @Published var movieDetail : MovieDetail?
    var movieDetailSubscription: AnyCancellable?
    
    init(movieID: Int) {
        getMovieDetails(movieID: movieID)
    }

    private func getMovieDetails(movieID: Int) {
        movieDetailSubscription = NetworkManager.download(url: constructURL(for: .movieDetail(movieID: movieID)))
            .decode(type: MovieDetail.self, decoder: JSONDecoder())
            .map { $0.self }
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedMovieDetail) in
                self?.movieDetail = returnedMovieDetail
                self?.movieDetailSubscription?.cancel()
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
