//
//  ContentView-ViewModel.swift
//  HoloWeb
//
//  Created by Alex on 04/12/2024.
//

import WebKit

extension WebView {
    @Observable class ViewModel {
        var urlString: String = "https://toji.github.io/webxr-particles/"
        var homePage: String = "https://immersive-web.github.io/webxr-samples/"
        var isFullScreen = false
        
        var canGoBack = false
        var canGoForward = false
        
        var webView: WKWebView!
    }
}
