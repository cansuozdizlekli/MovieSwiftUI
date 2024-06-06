//
//  ContentType.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/12/24.
//

import Foundation

enum ContentType {
    case json
    case multipartFromData

    var rawValue: String{
        switch self {
        case .json:
            "application/json"
        case .multipartFromData:
            ""
        }
    }
}
