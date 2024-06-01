
import Foundation
import Combine

class MovieImageService {
    @Published var movieImages : [Backdrop]?

    var movieImageSubscription: AnyCancellable?
    private let baseURL = "https://image.tmdb.org/t/p/"
    private let imageSize = "w500"
        
    init(movieID: Int) {
        getMovieImages(movieID: movieID)
    }

    
    private func getMovieImages(movieID: Int) {
        
        movieImageSubscription = NetworkManager.download(url: constructURL(for: .movieImage(movieID: movieID)))
            .decode(type: MovieImage.self, decoder: JSONDecoder())
            .map { $0.backdrops ?? [] }
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedImages) in
                self?.movieImages = returnedImages
                self?.movieImageSubscription?.cancel()
        })
    }
    
    
    private func constructURL(for endpoint: MovieEndpoint) -> URL {
        let urlWithParams = API.prepareUrl(withPath: endpoint.path)
        guard let urlWithApiKey = urlWithParams.addingApiKey() else {
                fatalError("API anahtarı eklenemedi.")
        }
        
        return urlWithApiKey
    }
    
    func imageURL(forPosterPath posterPath: String) -> URL? {
        let fullPosterPath = "\(baseURL)\(imageSize)\(posterPath)"
        return URL(string: fullPosterPath)
    }
    
    
}


