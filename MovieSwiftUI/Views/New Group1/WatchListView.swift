//
//  WatchListView.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/19/24.
//

import SwiftUI

struct WatchListView: View {
    @StateObject private var viewModel = WatchlistViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack(alignment:.leading) {
                headerView
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 4) {
                        
                        ForEach(viewModel.watchlistMoviesIds, id: \.self) { movieId in
                            NavigationLink(destination: MovieDetailView(movieId: movieId)) {
                                MovieListItemView(movieId: movieId)
                            }
                        }
                        
                    }
                }.padding([.leading,.trailing],10)
            }.background(Color.theme.background)
                .onAppear {
                    viewModel.refreshWatchlistMovies()
                }
        }
        
    }
}

#Preview {
    WatchListView()
}

extension WatchListView {
    var headerView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Watchlist")
                .font(.title)
                .fontWeight(.bold)
                .padding(.leading)
                .foregroundColor(Color.theme.secondaryText)
            
            if viewModel.watchlistMoviesIds.isEmpty {
                Text("There are no movies. Please add some here!")
                    .foregroundColor(Color.theme.secondaryText)
                    .padding(.leading)
                    
            }
        }
    }
}
