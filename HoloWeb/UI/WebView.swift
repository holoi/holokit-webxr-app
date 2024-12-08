// SPDX-FileCopyrightText: Copyright 2024 Reality Design Lab <dev@reality.design>
// SPDX-FileContributor: Yuchen Zhang <yuchen@reality.design>
// SPDX-License-Identifier: MIT

import SwiftUI

@MainActor
struct WebView {
    var viewModel = ViewModel()
    var fullscreenObserver = FullscreenObserver()

    static let shared = WebView()
    private init() {}

    func load() {
        guard let url = URL(string: viewModel.urlString) else {
            return
        }
        viewModel.webView.load(URLRequest(url: url))
    }

    func goBack() {
        viewModel.webView.goBack()
    }

    func goForward() {
        viewModel.webView.goForward()
    }

    func goHome() {
        viewModel.urlString = viewModel.homePage
        load()
    }
}
