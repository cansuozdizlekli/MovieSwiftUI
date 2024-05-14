//
//  MovieDetailView.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/8/24.
//

import SwiftUI

struct MovieDetailView: View {
    
    var movieId: Int
    @StateObject var viewModel: MovieDetailViewModel
    
    init(movieId: Int) {
          self.movieId = movieId
        self._viewModel = StateObject(wrappedValue: MovieDetailViewModel(movieID: movieId))
    }
    

    var body: some View {
        
        if let movieDetail = viewModel.movieDetail {
            Text(movieDetail.title ?? "") // Örnek olarak film başlığını gösteriyoruz
                    } else {
                        ProgressView() // Veriler yüklenirken progress göster
                }
    }
}

#Preview {
    MovieDetailView(movieId: 33)
}


