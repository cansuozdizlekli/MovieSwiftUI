//
//  MovieListViewModel.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/8/24.
//

import Foundation
import Combine

class MovieListViewModel : ObservableObject {
    
    @Published var nowPlayingMovies : [Results] = []
    
    private let dataService = MovieDataService()
    
    private var cancellables = Set<AnyCancellable>()
        
    init(){
        addSubscribers()
    }
    
    func addSubscribers(){
        dataService.$nowShowingMovies
            .sink { [weak self] (returnedMovies) in
                self?.nowPlayingMovies = returnedMovies
            }.store(in: &cancellables)
        
    }
}
