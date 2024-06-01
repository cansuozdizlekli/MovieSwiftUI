//
//  TabBarView.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/19/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            Group {
                MovieListView()
                    .tabItem {
                        Image("movie-list-tab-icon")
                            .renderingMode(.template)
                            .frame(width: 24,height: 24)
                            
                        
                    }
                WatchListView()
                    .tabItem {
                        Image("watchlist-tab-icon")
                            .renderingMode(.template)
                            .frame(width: 24,height: 24)
                    }
            }.toolbarBackground(Color.theme.background, for: .tabBar)
        }
    }
}

#Preview {
    TabBarView()
}
