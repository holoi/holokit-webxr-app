//
//  ContentView.swift
//  HoloKitWebXR
//
//  Created by Yuchen Zhang on 2023/8/2.
//

import SwiftUI


struct ContentView: View {
    
    @State private var showWebView = false
    private let urlString: String = "https://immersive-web.github.io/webxr-samples/immersive-ar-session.html"
    
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

#Preview {
    ContentView()
}
