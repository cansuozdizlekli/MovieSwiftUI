//
//  CastViewModel.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/14/24.
//

import Foundation
import Combine

class CastViewModel : ObservableObject {
    
    @Published var cast : [Cast] = []
    private let castService: CastDataService
    private let baseURL = "https://image.tmdb.org/t/p/"
    private let imageSize = "w500"
    private var cancellables = Set<AnyCancellable>()
    
    init(movieID: Int) {
        self.castService = CastDataService(movieID: movieID)
        addSubscribers()
    }
    
    func addSubscribers(){
        castService.$cast
            .sink { [weak self] (returnedCast) in
                self?.cast = returnedCast
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
