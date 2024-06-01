//
//  PhotoItemView.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/15/24.
//

import SwiftUI

struct VerticalPhotosView: View {

    @StateObject var viewModel: MovieImageViewModel
    @Environment(\.presentationMode) var presentationMode
    
    init(movieId: Int){
        self._viewModel = StateObject(wrappedValue: MovieImageViewModel(movieID: movieId))
    }
    
    var body: some View {
        VStack {
            Divider()
            ScrollView(.vertical) {
                    ForEach(viewModel.movieImages ?? []) { backdrops in
                        if backdrops.filePath != nil {
                            AsyncImage(
                                url: viewModel.imageURL(forPosterPath: backdrops.filePath ?? "" ),
                                content: { content in
                                    content.resizable()
                                },placeholder: {
    //                                ProgressView()
                                }).aspectRatio(contentMode: .fit)
                        }
                    }
                }
                .navigationTitle("Photos")
                    .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: backButton)
        }.background(Color.theme.background)

    }
}

#Preview {
    VerticalPhotosView(movieId: 33)
}


extension VerticalPhotosView {
    var backButton : some View {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack(spacing: 0) {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundColor(Color.theme.customGray)
            }
       }
   }
}

