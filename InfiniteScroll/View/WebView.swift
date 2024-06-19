//
//  WebView.swift
//  InfiniteScroll
//
//  Created by Micheal Bingham on 6/19/24.
//

import SwiftUI
import Foundation
import WebKit


struct WebView: View {
    let url: URL
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            if let errorMessage = errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            } else {
                UIWebView(url: url, errorMessage: $errorMessage)
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}


/*
#Preview {
    WebView()
}
*/
