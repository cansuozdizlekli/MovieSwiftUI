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
    private var cancellables = Set<AnyCancellable>()
    
    @Published var videoResult : [VideoResult]?
    private let videoService: MovieVideoService
    
    private let imageURLHelper = ImageURLHelper()
    
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
        return imageURLHelper.imageURL(forPosterPath: posterPath)
    }
}
