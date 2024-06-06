//
//  CastItemViewModel.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/14/24.
//

import Foundation
import Combine

class CastItemViewModel : ObservableObject {
    
    private let imageURLHelper = ImageURLHelper()
    
    func imageURL(forPosterPath posterPath: String) -> URL {
        return imageURLHelper.imageURL(forPosterPath: posterPath)
    }
}
