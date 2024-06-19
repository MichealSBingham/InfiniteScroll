//
//  UIWebView.swift
//  InfiniteScroll
//
//  Created by Micheal Bingham on 6/19/24.
//

import SwiftUI
import WebKit

struct UIWebView: UIViewRepresentable {
    let url: URL
    @Binding var errorMessage: String?

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: UIWebView

        init(_ parent: UIWebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            parent.errorMessage = error.localizedDescription
        }

        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
            parent.errorMessage = error.localizedDescription
        }
    }
}


#Preview {
    UIWebView(url: URL(string: "https://yahoo.com")!, errorMessage: .constant("No error"))
}
