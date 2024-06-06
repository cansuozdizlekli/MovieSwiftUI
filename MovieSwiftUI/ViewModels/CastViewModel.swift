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
    private var cancellables = Set<AnyCancellable>()
    private let imageURLHelper = ImageURLHelper()

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
        return imageURLHelper.imageURL(forPosterPath: posterPath)
    }
}
