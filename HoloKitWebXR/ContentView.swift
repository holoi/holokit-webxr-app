//
//  ContentView.swift
//  HoloKitWebXR
//
//  Created by Yuchen Zhang on 2023/8/2.
//

import SwiftUI
import WebKit

struct ContentView: View {
    
    @State private var showWebView = false
    private let urlString: String = "https://www.baidu.com"
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            WebView(url: URL(string: urlString)!)
                .ignoresSafeArea()
        }
        .onAppear() {
            ARManager.shared.StartARSession()
        }
    }
}

struct WebView: UIViewRepresentable {
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        
        let webPrefs = WKWebpagePreferences()
        webPrefs.allowsContentJavaScript = true
        
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.defaultWebpagePreferences = webPrefs
        webConfiguration.allowsInlineMediaPlayback = true
        webConfiguration.mediaTypesRequiringUserActionForPlayback = []
        
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        //webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        webView.isMultipleTouchEnabled = true
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

#Preview {
    ContentView()
}
