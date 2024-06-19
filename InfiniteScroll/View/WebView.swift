//
//  WebView.swift
//  InfiniteScroll
//
//  Created by Micheal Bingham on 6/19/24.
//

import SwiftUI
import Foundation
import WebKit

/// A view representing a web view for displaying web content.
struct WebView: View {
    let url: URL
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            if let errorMessage = errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
                    .accessibilityLabel(Text("Error: \(errorMessage)"))
            } else {
                UIWebView(url: url, errorMessage: $errorMessage)
                    .edgesIgnoringSafeArea(.all)
                    .accessibilityLabel(Text("Web content"))
            }
        }
    }
}



#Preview {
    WebView(url: URL(string: "https://google.com")!)
}

