//
//  MovieListItemView.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/8/24.
//

import SwiftUI

struct MovieListItemView: View {
    
    let movieId: Int
    @StateObject private var viewModel: MovieListItemViewModel
    
    init(movieId: Int) {
        self.movieId = movieId
        _viewModel = StateObject(wrappedValue: MovieListItemViewModel(movieID: movieId))
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                AsyncImage(
                    url: viewModel.imageURL(forPosterPath: viewModel.movieDetail?.posterPath ?? ""),
                    content: { content in
                        content.resizable()
                    },placeholder: {
                        ProgressView()
                    })
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width / 2.2, height: 250)
                
                HStack {
                    ForEach(0..<5) { index in
                        let filledStars = Double(viewModel.movieDetail?.voteAverage ?? 0) / 2
                        Image(systemName: index < Int(filledStars) ? "star.fill" : "star")
                            .resizable()
                            .frame(width: 14, height: 14)
                            .foregroundColor(Color.theme.star)
                    }.padding(.trailing,-5)
                }.padding(.top,15)
                
                VStack(alignment: .leading,spacing: 4) {
                    Text(viewModel.movieDetail?.title ?? "")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .lineLimit(1)
                    
                    HStack {
                        Text(viewModel.movieDetail?.genres?.first?.name ?? "")
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 3,height:3)
                        Text(viewModel.movieDetail?.formattedRuntime ?? "")
                    }.font(.system(size: 12))
                        .fontWeight(.medium)
                        .foregroundColor(Color.theme.customGray)
                    
                }
                
                Spacer()
                
            }.frame(width: UIScreen.main.bounds.width / 2.2 , height: 370)
            
        }
    }
}

#Preview {
    MovieListItemView(movieId: 32)
        .previewLayout(.sizeThatFits)
        .environmentObject(MovieListItemViewModel(movieID: 33))
}
