//
//  MovieListItemView.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/8/24.
//

import SwiftUI

struct MovieListItemView: View {
    @EnvironmentObject var viewModel: MovieListViewModel
    let movie: Results
    
    var body: some View {
        VStack() {
            VStack(alignment: .leading) {
                Image("image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width / 2.2, height: 280)

                HStack {
                    ForEach(0..<5) { _ in
                        Image(systemName: "star.fill")
                            .frame(width: 10,height: 10)
                            .foregroundColor(.yellow)
                    }.padding(.leading,3)
                }.padding(.leading,3)
                
                Text(movie.title ?? "")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                HStack {
                    Text("33 ")
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 3,height:3)
                    Text("2h 10m | R")
                }.font(.caption)
                    .foregroundColor(Color.theme.secondaryText)
                
                Spacer()
                
            }.frame(width: UIScreen.main.bounds.width / 2.2 , height: 370)
//                .background(Color.blue)
            
        }
    }
}

#Preview {
    MovieListItemView(movie: Results(adult: false, backdropPath: "/1DTP1Ph4uzNO6ofRUm7eAimWoKD.jpg", genreIDS:  [28, 878], id: 823464, originalLanguage: "en", originalTitle: "Godzilla x Kong: The New Empire", overview: "Following their explosive showdown, Godzilla and Kong must reunite against a colossal undiscovered threat hidden within our world, challenging their very existence – and our own.", popularity: 1506.77, posterPath: "/1DTP1Ph4uzNO6ofRUm7eAimWoKD.jpg", releaseDate: "2024-03-27", title: "Godzilla x Kong: The New Empire", video: false, voteAverage: 6.473, voteCount: 964))
        .previewLayout(.sizeThatFits)
        .environmentObject(MovieListViewModel())
}
