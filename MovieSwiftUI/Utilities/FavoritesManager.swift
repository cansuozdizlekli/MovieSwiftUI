//
//  WatchlistManager.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/21/24.
//

import Foundation

class FavoritesManager {
    static let shared = FavoritesManager()
    private let favoritesKey = "favoriteMovies"
    
    private init() {}
    
    func getFavoriteMovies() -> [Int] {
        return UserDefaults.standard.array(forKey: favoritesKey) as? [Int] ?? []
    }
    
    func addFavorite(movieID: Int) {
        var favorites = getFavoriteMovies()
        if !favorites.contains(movieID) {
            favorites.append(movieID)
            UserDefaults.standard.set(favorites, forKey: favoritesKey)
        }
    }
    
    func removeFavorite(movieID: Int) {
        var favorites = getFavoriteMovies()
        if let index = favorites.firstIndex(of: movieID) {
            favorites.remove(at: index)
            UserDefaults.standard.set(favorites, forKey: favoritesKey)
        }
    }
    
    func isFavorite(movieID: Int) -> Bool {
        return getFavoriteMovies().contains(movieID)
    }
}
