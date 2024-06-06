//
//  MovieSwiftUIWidgetEntryView.swift
//  MovieSwiftUIWidgetExtension
//
//  Created by Cansu Özdizlekli on 6/1/24.
//

import SwiftUI
import WidgetKit

struct MovieSwiftUIWidgetEntryView : View {
    
    @Environment(\.widgetFamily) private var widgetFamily
    @State private var isAppOpen = false
    var entry: Provider.Entry
    
    var title : String {
        if entry.movieCount == 0 {
            return "Add Some Movies Your Watchlist"
        } else {
            return "Pick Your Movie For Today"
        }
    }
    
    var subtitle : String {
        if entry.movieCount == 0 {
            return "Your watchlist is empty!"
        } else {
            return "~\(entry.movieCount) left"
        }
    }
    
    var mediumSubtitle : String {
        if entry.movieCount == 0 {
            return "Your watchlist is empty!"
        } else {
            return "Only \(entry.movieCount) films to go!"
        }
    }
    
    var body: some View {
        switch widgetFamily {
        case .systemSmall:
            VStack {
                Text(self.title)
                    .fontWeight(.bold)
                    .font(.caption)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .frame(width: 150,height: 30)
                    .padding(.top,20)
                    .foregroundStyle(.white)
                
                Text(self.subtitle)
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundStyle(.red)
                
                
                Image("popcorn")
                    .resizable()
                    .frame(width: 90,height: 90)
                    .cornerRadius(20)
                    .shadow(color: Color.gray.opacity(0.5), radius: 3, x: 0, y: -2)
                
            }.frame(width: 500,height: 500)
                .background(.widgetBackground)
        case .systemMedium:
            VStack {
                Text(self.title)
                    .fontWeight(.bold)
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .frame(height: 30)
                    .padding(.top,10)
                    .foregroundStyle(.white)
                
                Text(self.mediumSubtitle)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(.red)
                    .padding(.bottom,10)
                
                HStack(spacing: 20) {
                    Image("popcorn")
                        .resizable()
                        .frame(width: 90,height: 90)
                        .cornerRadius(20)
                        .shadow(color: Color.gray.opacity(0.5), radius: 3, x: 0, y: -2)
                        
                        .padding(.leading,30)
                    
                    if widgetFamily == .systemMedium {
                        Link(destination: URL(string: "MovieSwiftUI://")!) {
                            Text("Open Movie App")
                                .font(.subheadline)
                                .frame(width: 150,height: 50)
                                .background(Color.red)
                                .cornerRadius(20)
                                .foregroundColor(.white)
                                .padding()
                                .shadow(color: Color.gray.opacity(0.5), radius: 3, x: 0, y: -2)
                                .onTapGesture {
                                    isAppOpen = true
                                }
                        }
                    }
                    
                }.padding(.bottom,10)
                
                
            }.frame(width: 500,height: 500)
                .background(.widgetBackground)
        @unknown default:
            EmptyView()
        }
        
        
    }
}
