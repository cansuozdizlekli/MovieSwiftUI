//
//  YoutubeView.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/26/24.
//

import Foundation
import SwiftUI
import WebKit

struct YouTubeView: UIViewRepresentable {
    
    let videoId: String
    let isFullScreen: Bool
    
    func makeUIView(context: Context) ->  WKWebView {
        let config = WKWebViewConfiguration()
        config.mediaTypesRequiringUserActionForPlayback = []
        let webView = WKWebView(frame: .zero, configuration: config)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let demoURL = URL(string: "https://www.youtube.com/embed/\(videoId)?autoplay=1") else { return }
        
        uiView.scrollView.isScrollEnabled = false
        
        if isFullScreen {
            uiView.frame = UIScreen.main.bounds
        }else {
            uiView.isHidden = true
        }
        
        uiView.load(URLRequest(url: demoURL))
    }
}
