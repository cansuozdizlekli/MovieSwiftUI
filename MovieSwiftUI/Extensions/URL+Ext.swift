//
//  URL+Ext.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/12/24.
//

import Foundation

public extension URL {
    func addingParameters(parameters: [String: String]) -> URL {
        guard parameters.count > 0 else {return self}
        var queryItems: [URLQueryItem] = []
        for parameter in parameters {
            queryItems.append(URLQueryItem(name: parameter.key, value: parameter.value))
        }
         return addingQueryItems(queryItems: queryItems)
    }

    private func addingQueryItems(queryItems: [URLQueryItem]) -> URL {
        guard var urlComponents = URLComponents(string: absoluteString) else {
            fatalError("Could not create URLComponents")
        }

        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else {
            fatalError("Could not create URL")
        }
        return url
    }
    
    func addingApiKey() -> URL? {
        let apiKey = "76b0e8454bbbcbeef094c7e4fc5ece8e"
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
            return nil
        }
        
        let apiKeyQueryItem = URLQueryItem(name: "api_key", value: apiKey)
        components.queryItems = (components.queryItems ?? []) + [apiKeyQueryItem]
        
        return components.url
    }
}
