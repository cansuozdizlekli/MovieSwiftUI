//
//  MovieDetail.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/8/24.
//

import Foundation

// MARK: - MovieDetails
struct MovieDetail : Decodable , Identifiable {
    let adult: Bool?
    let backdropPath: String?
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
    let revenue: Int?
    let status, tagline, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
            case adult
            case backdropPath = "backdrop_path"
            case budget, genres, homepage, id
            case imdbID = "imdb_id"
            case originCountry = "origin_country"
            case originalLanguage = "original_language"
            case originalTitle = "original_title"
            case overview, popularity
            case posterPath = "poster_path"
            case releaseDate = "release_date"
            case revenue, runtime
            case spokenLanguages = "spoken_languages"
            case status, tagline, title, video
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
        }
    
    let runtime: Int?

        var formattedRuntime: String {
            guard let runtime = runtime else { return "" }

            let hours = runtime / 60
            let minutes = runtime % 60

            if hours > 0 && minutes > 0 {
                return "\(hours)hr \(minutes)m"
            } else if hours > 0 {
                return "\(hours)hr"
            } else {
                return "\(minutes)m"
            }
        }
    

    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
            backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
            budget = try container.decodeIfPresent(Int.self, forKey: .budget)
            genres = try container.decodeIfPresent([Genre].self, forKey: .genres)
            homepage = try container.decodeIfPresent(String.self, forKey: .homepage)
            id = try container.decode(Int.self, forKey: .id)
            imdbID = try container.decodeIfPresent(String.self, forKey: .imdbID)
            originCountry = try container.decodeIfPresent([String].self, forKey: .originCountry)
            originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage)
            originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
            overview = try container.decodeIfPresent(String.self, forKey: .overview)
            popularity = try container.decodeIfPresent(Double.self, forKey: .popularity)
            posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
            releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
            revenue = try container.decodeIfPresent(Int.self, forKey: .revenue)
            runtime = try container.decodeIfPresent(Int.self, forKey: .runtime)
            status = try container.decodeIfPresent(String.self, forKey: .status)
            tagline = try container.decodeIfPresent(String.self, forKey: .tagline)
            title = try container.decodeIfPresent(String.self, forKey: .title)
            video = try container.decodeIfPresent(Bool.self, forKey: .video)
            voteAverage = try container.decodeIfPresent(Double.self, forKey: .voteAverage)
            voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
        }
}
