//
//  MovieImageViewModel.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/15/24.
//

import Foundation
import Combine

class MovieImageViewModel : ObservableObject {
    
    @Published var movieImages : [Backdrop]?
    private let imageService: MovieImageService
    private var cancellables = Set<AnyCancellable>()
    private let imageURLHelper = ImageURLHelper()
    
    init(movieID: Int) {
        self.imageService = MovieImageService(movieID: movieID)
        addSubscribers()
    }
    
    func addSubscribers(){
        imageService.$movieImages
            .sink { [weak self] (returnedImages) in
                self?.movieImages = returnedImages
            }.store(in: &cancellables)
    }
    
   
    func imageURL(forPosterPath posterPath: String) -> URL {
        return imageURLHelper.imageURL(forPosterPath: posterPath)
    }
}
