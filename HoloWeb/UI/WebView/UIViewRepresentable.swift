//
//  UIViewRepresentable.swift
//  HoloWeb
//
//  Created by Alex on 08/12/2024.
//

import SwiftUI
import WebKit

extension WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView

    func makeUIView(context: Context) -> UIViewType {
        let appName = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String ?? ""
        
        let webPrefs = WKWebpagePreferences()
        webPrefs.allowsContentJavaScript = true
        
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.defaultWebpagePreferences = webPrefs
        webConfiguration.allowsInlineMediaPlayback = true
        webConfiguration.mediaTypesRequiringUserActionForPlayback = []
        webConfiguration.preferences.isElementFullscreenEnabled = true
        webConfiguration.applicationNameForUserAgent = "Mobile/\(appName)"
        
        // Inject webxr-polyfill.js
//        if let path = Bundle.main.path(forResource: "webxr-polyfill", ofType: "js"),
//           let webxrPolyfillScript = try? String(contentsOfFile: path) {
//            let userScript = WKUserScript(source: webxrPolyfillScript, injectionTime: .atDocumentStart, forMainFrameOnly: true)
//            webConfiguration.userContentController.addUserScript(userScript)
//        }
        
        if let path = Bundle.main.path(forResource: "webxr2.0", ofType: "js"),
           let webxrPolyfillScript = try? String(contentsOfFile: path, encoding: .utf8) {
            let userScript = WKUserScript(source: webxrPolyfillScript, injectionTime: .atDocumentStart, forMainFrameOnly: true)
            webConfiguration.userContentController.addUserScript(userScript)
        }
        
        // Inject holokit-ar.js
        if let path = Bundle.main.path(forResource: "holokit-ar", ofType: "js"),
           let holokitArScript = try? String(contentsOfFile: path, encoding: .utf8) {
            let userScript = WKUserScript(source: holokitArScript, injectionTime: .atDocumentStart, forMainFrameOnly: true)
            webConfiguration.userContentController.addUserScript(userScript)
        }
        
        webConfiguration.userContentController.add(Coordinator(self), name: "logHandler")
        
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.allowsBackForwardNavigationGestures = true
        webView.isMultipleTouchEnabled = true
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        webView.scrollView.isScrollEnabled = true
        webView.navigationDelegate = context.coordinator
        viewModel.webView = webView
        load()
        
        // to react to entering/exiting fullscreen mode (observe changes of parent.viewModel.webView.fullscreenState)
        webView.addObserver(fullscreenObserver, forKeyPath: "fullscreenState", options: .new, context: nil)
        
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
    static func dismantleUIView(
        _ uiView: Self.UIViewType,
        coordinator: Self.Coordinator
    ) {
        uiView.removeObserver(FullscreenObserver(), forKeyPath: "fullscreenState")
    }
        
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}
