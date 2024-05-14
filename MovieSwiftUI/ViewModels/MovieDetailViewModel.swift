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
}
