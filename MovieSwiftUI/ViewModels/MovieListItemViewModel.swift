//
//  MovieListItemViewModel.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/13/24.
//

import Foundation
import Combine

class MovieListItemViewModel : ObservableObject {
    
    @Published var movieDetail : MovieDetail?
    private let detailService: MovieDetailService
    private var cancellables = Set<AnyCancellable>()
    private let baseURL = "https://image.tmdb.org/t/p/"
    private let imageSize = "w500"
    
    init(movieID: Int) {
        self.detailService = MovieDetailService(movieID: movieID)
        addSubscribers()
    }
    
    func addSubscribers(){
        detailService.$movieDetail
            .sink { [weak self] (returnedMovieDetail) in
                self?.movieDetail = returnedMovieDetail
            }.store(in: &cancellables)

    }
        
    func imageURL(forPosterPath posterPath: String) -> URL {
        let fullPosterPath = "\(baseURL)\(imageSize)\(posterPath)"
        guard let url = URL(string: fullPosterPath) else {
            print("Invalid URL for image")
            return URL(filePath: "")
        }
        return url
    }
    
    
        
}
