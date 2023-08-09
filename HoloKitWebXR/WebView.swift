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
        
        // Inject webxr-polyfill.js
        if let path = Bundle.main.path(forResource: "webxr-polyfill", ofType: "js"),
           let webxrPolyfillScript = try? String(contentsOfFile: path) {
            let userScript = WKUserScript(source: webxrPolyfillScript, injectionTime: .atDocumentStart, forMainFrameOnly: true)
            webConfiguration.userContentController.addUserScript(userScript)
        }
        
        // Inject holokit-ar.js
        if let path = Bundle.main.path(forResource: "holokit-ar", ofType: "js"),
           let holokitArScript = try? String(contentsOfFile: path) {
            let userScript = WKUserScript(source: holokitArScript, injectionTime: .atDocumentStart, forMainFrameOnly: true)
            webConfiguration.userContentController.addUserScript(userScript)
        }
        
        webConfiguration.userContentController.add(Coordinator(self), name: "logHandler")
        
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.allowsBackForwardNavigationGestures = true
        webView.isMultipleTouchEnabled = true
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        webView.navigationDelegate = context.coordinator
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            if message.name == "logHandler", let logMessage = message.body as? String {
                print(logMessage)
            }
        }
    }
}
