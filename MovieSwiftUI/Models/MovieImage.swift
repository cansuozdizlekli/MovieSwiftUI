//
//  MovieImage.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/15/24.
//

import Foundation

// MARK: - MovieImage
struct MovieImage: Codable , Identifiable {
    let backdrops: [Backdrop]?
    let id: Int?
    let logos, posters: [Backdrop]?
}

// MARK: - Backdrop
struct Backdrop: Codable , Identifiable{
    var id: UUID = UUID()
    let aspectRatio: Double?
    let height: Int?
    let filePath: String?
    let width: Int?

    enum CodingKeys: String, CodingKey {
        case aspectRatio = "aspect_ratio"
        case height
        case filePath = "file_path"
        case width
    }
}
