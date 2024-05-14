//
//  MovieDetail.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/8/24.
//

import Foundation

// MARK: - MovieDetails
struct MovieDetail : Codable , Identifiable {
    let adult: Bool?
    let backdropPath: String?
//    let belongsToCollection: NSNull?
    let budget: Int?
    let genres: [Genre]?
    let homepage: String?
    let id: Int?
    let imdbID: String?
    let originCountry: [String]?
    let originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let revenue, runtime: Int?
    let status, tagline, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
}

// MARK: - Genre
struct Genre : Codable , Identifiable{
    let id: Int?
    let name: String?
}
