//
//  ListItemView.swift
//  InfiniteScroll
//
//  Created by Micheal Bingham on 6/19/24.
//

import SwiftUI

struct ListItemView: View {
    var item: ListItem
    @ObservedObject var viewModel: ListViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            if case .folder(let subItems) = item.type {
                Button(action: {
                    withAnimation {
                        viewModel.toggleExpansion(for: item)
                    }
                }) {
                    HStack {
                        Text(item.title)
                        Spacer()
                        Image(systemName: item.isExpanded ? "chevron.down" : "chevron.right")
                    }
                }
                
                if item.isExpanded {
                    ForEach(subItems) { subItem in
                        ListItemView(item: subItem, viewModel: viewModel)
                            .padding(.leading, 20)
                    }
                }
            } else if case .link(let url) = item.type {
                NavigationLink(destination: WebView(url: URL(string: url)!)) {
                    Text(item.title)
                }
            }
        }
    }
}

/*
#Preview {
    ListItemView()
}
*/
