//
//  ImageURLHelper.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 6/6/24.
//

import Foundation

class ImageURLHelper {
    private let baseURL = "https://image.tmdb.org/t/p/"
    private let imageSize = "w500"
    
    func imageURL(forPosterPath posterPath: String) -> URL {
        let fullPosterPath = "\(baseURL)\(imageSize)\(posterPath)"
        guard let url = URL(string: fullPosterPath) else {
            print("Invalid URL for image")
            return URL(fileURLWithPath: "")
        }
        return url
    }
}
