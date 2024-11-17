// SPDX-FileCopyrightText: Copyright 2024 Reality Design Lab <dev@reality.design>
// SPDX-FileContributor: Yuchen Zhang <yuchen@reality.design>
// SPDX-License-Identifier: MIT

import SwiftUI

struct ContentView: View {
    
    @State private var showWebView = false
    private let urlString: String = "https://toji.github.io/webxr-particles/"
    
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
