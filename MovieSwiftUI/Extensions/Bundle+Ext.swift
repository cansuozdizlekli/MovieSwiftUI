//
//  Bundle+Ext.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/12/24.
//

import Foundation

public extension Bundle {
    func infoForKey(_ key: String) -> String? {
        (infoDictionary?[key] as? String)?.replacingOccurrences(of: "\\", with: "")
    }
}

