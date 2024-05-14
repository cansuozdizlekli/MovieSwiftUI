//
//  MovieListItemViewModel.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/13/24.
//

import Foundation

class MovieListItemViewModel : ObservableObject {
    
    private let baseURL = "https://image.tmdb.org/t/p/" 
    private let imageSize = "w500"
        
    func imageURL(forPosterPath posterPath: String) -> URL {
        let fullPosterPath = "\(baseURL)\(imageSize)\(posterPath)"
        guard let url = URL(string: fullPosterPath) else {
            print("Invalid URL for image")
            return URL(filePath: "")
        }
        return url
    }
        
}
