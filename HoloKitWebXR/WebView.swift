//
//  WebView.swift
//  HoloKitWebXR
//
//  Created by Yuchen Zhang on 2023/8/8.
//

import SwiftUI
import WebKit

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
        webView.navigationDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = true
        webView.isMultipleTouchEnabled = true
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            // Load and inject the JavaScript code when the web page finishes loading
            if let scriptContent = try? String(contentsOf: Bundle.main.url(forResource: "webxr", withExtension: ".js")!) {
                webView.evaluateJavaScript(scriptContent) { (result, error) in
                    if let error = error {
                        print("Failed to inject JavaScript with error: \(error.localizedDescription)")
                    } else {
                        print("Successfully injected JavaScript")
                    }
                }
            }
        }
    }
}
