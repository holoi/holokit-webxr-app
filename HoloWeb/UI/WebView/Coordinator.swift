//
//  Coordinator.swift
//  HoloWeb
//
//  Created by Alex on 08/12/2024.
//

import WebKit

extension WebView {
    
    class Coordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation) {
            parent.viewModel.urlString = webView.url?.absoluteString ?? ""
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.viewModel.canGoBack = webView.canGoBack
            parent.viewModel.canGoForward = webView.canGoForward
        }
        
        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            if message.name == "logHandler", let logMessage = message.body as? String {
                print(logMessage)
            }
        }
    }
    
}
