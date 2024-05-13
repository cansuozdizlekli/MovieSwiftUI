//
//  API.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/12/24.
//

import Foundation

public enum API {
    
    static func addingApiKey() {
        var apiKey: String {
            return "76b0e8454bbbcbeef094c7e4fc5ece8e"
        }
    }
    
    static func prepareUrl(withPath path: String) -> URL {
        guard let baseURL = Bundle.main.infoForKey("BASE_URL") else {
            fatalError("Could not create BaseURL")
        }

        guard let url = URL(string: "\(baseURL)\(path)") else {
            fatalError("Could not create url")
        }

        return url
    }

    static func getHeader(contentType: ContentType) -> [String: String] {
        var headers: [String: String] = [:]
        //header["Authorizaition"] = "Bearer "
        headers["Content-Type"] = contentType.rawValue
        return headers
    }

}
