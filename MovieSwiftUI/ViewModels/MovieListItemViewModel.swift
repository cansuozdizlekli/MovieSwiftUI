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
    private let imageURLHelper = ImageURLHelper()

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
        return imageURLHelper.imageURL(forPosterPath: posterPath)
    }
    
    
        
}
