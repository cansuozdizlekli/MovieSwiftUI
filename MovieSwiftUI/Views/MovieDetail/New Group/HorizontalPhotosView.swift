//
//  HorizontalPhotosView.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/16/24.
//

import SwiftUI

struct HorizontalPhotosView: View {
    @StateObject var viewModel: MovieImageViewModel
    let imageWidth: CGFloat = 104 // Resim genişliği
    let imageHeight : CGFloat = 72

    init(movieId: Int){
        self._viewModel = StateObject(wrappedValue: MovieImageViewModel(movieID: movieId))
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            ScrollViewReader { proxy in
                LazyHStack(spacing: 8) {
                    ForEach(viewModel.movieImages ?? []) { backdrops in
                        if backdrops.filePath != nil {
                            AsyncImage(
                                url: viewModel.imageURL(forPosterPath: backdrops.filePath ?? ""),
                                content: { content in
                                    content
                                        .resizable()
                                        .scaledToFit()
                                }, placeholder: {
                                    ProgressView()
                                }).aspectRatio(contentMode: .fit)
                                .frame(width: imageWidth, height: imageHeight)
                        }
                    }
                }
            }
        }.padding([.leading],15)
        .background(Color.theme.background)
        .frame(width: UIScreen.main.bounds.width, height: imageHeight)
    }
}


#Preview {
    HorizontalPhotosView(movieId: 33)
}

