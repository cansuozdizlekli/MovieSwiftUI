//
//  MovieDetailViewModel.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/8/24.
//

import Foundation

class MovieDetailViewModel {
    
}


//class MovieListViewModel : ObservableObject {
//    
//    @Published var nowPlayingMovies : [Results] = []
////    @Published var movieDetail : Results
//    
//    private let dataService = MovieDataService()
//    
//    private var cancellables = Set<AnyCancellable>()
//        
//    init(){
//        addSubscribers()
//    }
//    
//    func addSubscribers(){
//        dataService.$nowShowingMovies
////            .map { movieResponse in
////                   return movieResponse
////            }
//            .sink { [weak self] (returnedMovies) in
//                self?.nowPlayingMovies = returnedMovies
//            }.store(in: &cancellables)
//        
////        dataService.$MovieDetail
////            .sink { [weak self] returnedMovie in
////                self?.movieDetail = returnedMovie
////            }.store(in: &cancellables)
//    }
//}
