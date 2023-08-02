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
        }
    }
}

struct WebView: UIViewRepresentable {
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

#Preview {
    ContentView()
}
