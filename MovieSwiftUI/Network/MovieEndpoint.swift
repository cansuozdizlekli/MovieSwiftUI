//
//  MovieEndpoint.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/8/24.
//

import Foundation

protocol Endpoint {
    var path: String { get }
}

enum MovieEndpoint {
    case nowPlaying
    case popular
    case genre
    case movieDetail(movieID: Int)
    case movieImage(movieID: Int)
    case movieVideo(movieID: Int)
    case cast(movieID: Int)
}

extension MovieEndpoint: Endpoint {
    
    var path: String {
        switch self {
        case .nowPlaying:
            return "/movie/now_playing"
        case .popular:
            return "/movie/popular"
        case .movieDetail(let movieID):
            return "/movie/\(movieID)"
        case .movieImage(let movieID):
            return "/movie/\(movieID)/images"
        case .movieVideo(let movieID):
            return "/movie/\(movieID)/videos"
        case .cast(let movieID):
            return "/movie/\(movieID)/credits"
        case .genre:
            return "/genre/movie/list"
        }
    }
    
    
}
