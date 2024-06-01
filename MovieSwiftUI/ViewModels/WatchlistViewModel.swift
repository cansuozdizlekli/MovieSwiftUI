import SwiftUI
import Combine

class WatchlistViewModel: ObservableObject {
    @Published var watchlistMoviesIds: [Int] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        watchlistMoviesIds = FavoritesManager.shared.getFavoriteMovies()
    }
    
    func refreshWatchlistMovies() {
        watchlistMoviesIds = FavoritesManager.shared.getFavoriteMovies()
    }

}
