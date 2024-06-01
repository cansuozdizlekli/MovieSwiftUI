//
//  MovieDetailViewModel.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/8/24.
//

import Foundation
import Combine

class MovieDetailViewModel : ObservableObject {
    
    @Published var movieDetail : MovieDetail?
    private let detailService: MovieDetailService
    private let baseURL = "https://image.tmdb.org/t/p/"
    private let imageSize = "w500"
    private var cancellables = Set<AnyCancellable>()
    
    @Published var videoResult : [VideoResult]?
    private let videoService: MovieVideoService
    
    init(movieID: Int) {
        self.detailService = MovieDetailService(movieID: movieID)
        self.videoService = MovieVideoService(movieID: movieID)
        addSubscribers()
    }
    
    func addSubscribers(){
        detailService.$movieDetail
            .sink { [weak self] (returnedMovieDetail) in
                self?.movieDetail = returnedMovieDetail
            }.store(in: &cancellables)
        
        videoService.$videoResult
            .sink { [weak self] (returnedMovieVideos) in
                self?.videoResult = returnedMovieVideos
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
