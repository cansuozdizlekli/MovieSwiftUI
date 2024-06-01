//
//  ContentView.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/8/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var viewModel: MovieListViewModel
    
    var body: some View {
        TabBarView()
    }
}

#Preview {
    ContentView()
        .environmentObject(MovieListViewModel())
}
