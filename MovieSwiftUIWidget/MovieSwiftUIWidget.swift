//
//  MovieSwiftUIWidget.swift
//  MovieSwiftUIWidget
//
//  Created by Cansu Özdizlekli on 6/1/24.
//

import WidgetKit
import SwiftUI

struct MovieEntry: TimelineEntry {
    let date: Date
    let movieCount : Int
}

struct MovieSwiftUIWidget: Widget {
    let kind: String = "MovieSwiftUIWidget"
    let descriptionString = "Movie App Widget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                MovieSwiftUIWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                MovieSwiftUIWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("MovieSwiftUI")
        .description(descriptionString)
        .supportedFamilies([.systemSmall,.systemMedium])
    }
}

#Preview(as: .systemMedium) {
    MovieSwiftUIWidget()
} timeline: {
    MovieEntry(date: .now, movieCount: FavoritesManager.shared.getFavoriteMovies().count)
}
