//
//  MovieDetailView.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/8/24.
//

import SwiftUI
import WebKit

struct MovieDetailView: View {
    
    var movieId: Int
    @State var showOverview : Bool = false
    @State var showVideo : Bool = false
    @State private var isCastExtended: Bool = false
    @StateObject var viewModel: MovieDetailViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var isFavorite: Bool = false
    
    
    init(movieId: Int) {
        self.movieId = movieId
        self._viewModel = StateObject(wrappedValue: MovieDetailViewModel(movieID: movieId))
    }
    
    
    var body: some View {
        ScrollView {
            ZStack {
                ZStack {
                    AsyncImage(
                        url: viewModel.imageURL(forPosterPath: viewModel.movieDetail?.posterPath ?? ""),
                        content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width , height: 300)
                                .clipShape(Rectangle())
                                .blur(radius: 1)
                                .zIndex(1)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    
                    if showVideo {
                        YouTubeView(videoId: viewModel.videoResult?.first?.key ?? "", isFullScreen: showVideo)
                            .frame(width: UIScreen.main.bounds.width, height: 300)
                            .opacity(0)
                            .onDisappear {
                                showVideo.toggle()
                            }
                    }
                    
                    Button {
                        showVideo.toggle()
                    } label: {
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .tint(Color.white)
                            .overlay {
                                Circle()
                                    .stroke(Color.white.opacity(0.3), lineWidth: 20)
                            }
                    }.offset(x:0,y:-50)
                    
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 12, height: 20.5)
                            .tint(Color.white)
                    }.offset(x:-170,y:-78)
                    
                    Button {
                        toggleFavorite()
                    } label: {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width: 23.5, height: 20.5)
                            .tint(Color.white)
                    }.offset(x:170,y:-78)
                }
                
                AsyncImage(
                    url: viewModel.imageURL(forPosterPath: viewModel.movieDetail?.posterPath ?? ""),
                    content: { content in
                        content.resizable()
                    },placeholder: {
                        ProgressView()
                    })
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width / 2.2, height: 280)
                .offset(x:0,y:140)
                
            }
            
            
            Spacer(minLength: 160)
            VStack {
                
                Text(viewModel.movieDetail?.title ?? "")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(3)
                    .multilineTextAlignment(.center)
                Text(viewModel.movieDetail?.formattedRuntime ?? "")
                    .foregroundColor(Color.theme.customGray)
                    .font(.footnote)
                genreView
                ratingView
                synopsisView
                castListView
                photosView
                
                Spacer(minLength: 80)
            }
            
            
            
        }.navigationBarHidden(true)
            .padding([.leading,.trailing],14)
            .edgesIgnoringSafeArea(.all)
            .background(Color.theme.background)
            .onAppear {
                isFavorite = FavoritesManager.shared.isFavorite(movieID: movieId)
            }
        
        
    }
    
    private func toggleFavorite() {
        if isFavorite {
            FavoritesManager.shared.removeFavorite(movieID: movieId)
        } else {
            FavoritesManager.shared.addFavorite(movieID: movieId)
        }
        isFavorite.toggle()
    }
}

#Preview {
    MovieDetailView(movieId: 22)
}


extension MovieDetailView {
    private var castListView : some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Cast & Crew")
                    .font(.title3)
                    .fontWeight(.medium)
                Spacer()
                
                NavigationLink(
                    destination: CastView(movieId: self.movieId, isCastExtended: $isCastExtended),
                    isActive: $isCastExtended
                ) {
                    Button(action: {
                        isCastExtended.toggle()
                    }, label: {
                        Text("View All")
                            .foregroundColor(Color.theme.accent)
                            .font(.subheadline)
                        
                    })
                }
            }.padding([.leading,.trailing],15)
            CastView(movieId: self.movieId, isCastExtended: $isCastExtended)
        }
    }
    
    
    private var photosView : some View {
        VStack(alignment:.leading) {
            HStack {
                Text("Photos")
                    .font(.title3)
                    .fontWeight(.medium)
                Spacer()
                
                NavigationLink {
                    VerticalPhotosView(movieId: self.movieId)
                } label: {
                    Text("View All")
                        .foregroundColor(Color.theme.accent)
                        .font(.subheadline)
                }
            }.padding([.leading,.trailing],15)
            HorizontalPhotosView(movieId: self.movieId)
        }
    }
    
    private var synopsisView : some View {
        VStack {
            VStack(alignment:.leading) {
                Text("Synopsis")
                    .font(.title3)
                    .fontWeight(.medium)
                    .padding(.bottom,10)
                
                Text(viewModel.movieDetail?.overview ?? "")
                    .lineLimit(showOverview ? 20 : 4)
                    .foregroundColor(Color.theme.customGray)
                    .font(.subheadline)
                    .lineSpacing(6)
            }.padding([.leading,.trailing],15)
            
            Button(action: {
                showOverview.toggle()
            }, label: {
                Text("Show More")
                    .font(.subheadline)
                    .foregroundColor(Color.theme.accent)
            }).padding(5)
        }
    }
    
    private var ratingView : some View {
        HStack {
            Text(String(format: "%.1f", Double(viewModel.movieDetail?.voteAverage ?? 0) / 2) + "/5")
                .font(.title)
            
            ForEach(0..<5) { index in
                let filledStars = Double(viewModel.movieDetail?.voteAverage ?? 0) / 2
                Image(systemName: index < Int(filledStars) ? "star.fill" : "star")
                    .frame(width: 10, height: 10)
                    .foregroundColor(Color.theme.star)
            }.padding(.leading, 3)
        }
    }
    
    private var genreView : some View {
        HStack {
            if let genres = viewModel.movieDetail?.genres {
                ForEach(genres.indices, id: \.self) { index in
                    Text(genres[index].name ?? "")
                    if index != genres.count - 1 {
                        Text(",")
                    }
                }.foregroundColor(Color.theme.customGray)
                    .fontWeight(.medium)
                    .font(.footnote)
            }
        }.padding(5)
    }
    
}

extension MovieDetailView {
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

//
//struct YouTubeView: UIViewRepresentable {
//    let videoId: String
//    let isFullScreen: Bool
//    
//    func makeUIView(context: Context) ->  WKWebView {
//        let config = WKWebViewConfiguration()
//        config.mediaTypesRequiringUserActionForPlayback = []
//        let webView = WKWebView(frame: .zero, configuration: config)
//        return webView
//    }
//    
//    func updateUIView(_ uiView: WKWebView, context: Context) {
//        guard let demoURL = URL(string: "https://www.youtube.com/embed/\(videoId)?autoplay=1") else { return }
//        
//        uiView.scrollView.isScrollEnabled = false
//        
//        if isFullScreen {
//            uiView.frame = UIScreen.main.bounds
//        }else {
//            uiView.isHidden = true
//        }
//        
//        uiView.load(URLRequest(url: demoURL))
//    }
//}
