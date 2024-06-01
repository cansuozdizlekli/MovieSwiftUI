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
    private let baseURL = "https://image.tmdb.org/t/p/"
    private let imageSize = "w500"
    private var cancellables = Set<AnyCancellable>()
    
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
        let fullPosterPath = "\(baseURL)\(imageSize)\(posterPath)"
        guard let url = URL(string: fullPosterPath) else {
            print("Invalid URL for image")
            return URL(filePath: "")
        }
        return url
    }
}
