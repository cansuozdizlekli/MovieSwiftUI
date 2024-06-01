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
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                headerView
                moviesSection
            }.background(Color.theme.background)
        }
    }
    
}

extension MovieListView {
    
    var headerView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Movies")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.theme.secondaryText)
                .padding(.leading)
            
            HStack(spacing: 4) {
                Image(systemName: "play.circle.fill")
                Text("Now Showing")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .padding([.leading, .bottom])
        }
    }
    
    var moviesSection: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 4) {
                    ForEach(viewModel.nowPlayingMovies.indices, id: \.self) { index in
                        let movie = viewModel.nowPlayingMovies[index]
                        NavigationLink(destination:
                                        MovieDetailView(movieId: movie.id)
                                       
                        ) {
                            MovieListItemView(movieId: movie.id)
                        }
                    }
                }
            }.padding([.leading,.trailing],10)
                .onChange(of: scrollToTop) { oldValue, newValue in
                    if newValue {
                        withAnimation {
                            proxy.scrollTo(0, anchor: .top)
                        }
                        scrollToTop = false
                    }
                }
            
        }
    }
}

#Preview {
    MovieListView()
        .environmentObject(MovieListViewModel())
}

