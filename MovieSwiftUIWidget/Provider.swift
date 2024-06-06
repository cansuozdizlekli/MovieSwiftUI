//
//  Provider.swift
//  MovieSwiftUIWidgetExtension
//
//  Created by Cansu Özdizlekli on 6/1/24.
//


import SwiftUI
import WidgetKit

struct Provider: TimelineProvider {
    typealias Entry = MovieEntry
    func placeholder(in context: Context) -> MovieEntry {
        MovieEntry(date: Date(), movieCount: FavoritesManager.shared.getFavoriteMovies().count)
    }

    func getSnapshot(in context: Context, completion: @escaping (MovieEntry) -> ()) {
        let entry = MovieEntry(date: Date(), movieCount: FavoritesManager.shared.getFavoriteMovies().count)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [MovieEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 1 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = MovieEntry(date: entryDate, movieCount: FavoritesManager.shared.getFavoriteMovies().count)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
