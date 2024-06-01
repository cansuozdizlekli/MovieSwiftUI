//
//  Video.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/17/24.
//

import Foundation
// MARK: - Video
struct Video: Codable , Identifiable{
    let id: Int?
    let results: [VideoResult]?
}

// MARK: - Result
struct VideoResult: Codable {
    let name, key: String?
    let site: String?
    let size: Int?
    let type: String?
    let official: Bool?
    let publishedAt: String?
    let id: String?

    enum CodingKeys: String, CodingKey {
        case name, key, site, size, type, official
        case publishedAt = "published_at"
        case id
    }
}
