//
//  MovieListView.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/8/24.
//

import SwiftUI
import Combine

struct MovieListView: View {
    
    @StateObject private var viewModel = MovieListViewModel()
    @State private var currentPage = 1
    
    let adaptiveColumns = [
            GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ZStack {
            //background layer
            Color.theme.background
                .ignoresSafeArea()
            
            VStack(alignment:.leading) {
                Text("Movies")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading)
                    .foregroundColor(Color.theme.secondaryText)
                
                HStack(spacing: 4) {
                    Image(systemName: "play.circle.fill")
                    Text("Now Showing")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }.padding([.leading,.bottom])
                
                
                NavigationView {
                    ScrollView {
                        LazyVGrid(columns: adaptiveColumns, spacing: 4) {
                            ForEach(viewModel.nowPlayingMovies) { movie in
                                NavigationLink(destination:
                                                MovieDetailView(movieId: movie.id)
                                ) {
                                    MovieListItemView(movie: movie)
                                }
                            }
                        }
                    }.background(Color.theme.background)
                        .padding([.leading,.trailing],10)
                }
            }
        }
    }

    
}

#Preview {
    MovieListView()
        .environmentObject(MovieListViewModel())
}
