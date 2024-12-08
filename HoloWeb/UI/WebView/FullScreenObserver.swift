//
//  FullScreenObserver.swift
//  HoloWeb
//
//  Created by Alex on 08/12/2024.
//

import WebKit

extension WebView {

    class FullscreenObserver: NSObject {

        override func observeValue(
            forKeyPath keyPath: String?,
            of object: Any?,
            change: [NSKeyValueChangeKey: Any]?,
            context: UnsafeMutableRawPointer?
        ) {
            guard keyPath == "fullscreenState" else { return }
            guard let change = change else { return }

            let fullScreenState = change[.newKey] as? WKWebView.FullscreenState.RawValue
            let isFullScreen: Bool

            switch fullScreenState {
            case WKWebView.FullscreenState.inFullscreen.rawValue:
                isFullScreen = true
            case WKWebView.FullscreenState.notInFullscreen.rawValue:
                isFullScreen = false
            default:
                return
            }

            Task { @MainActor in
                WebView.shared.viewModel.isFullScreen = isFullScreen
                print("\(isFullScreen ? "Entered" : "Exited") full screen.")
            }
        }

    }
}
