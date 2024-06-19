//
//  ListItemView.swift
//  InfiniteScroll
//
//  Created by Micheal Bingham on 6/19/24.
//

import SwiftUI

/// A view representing a single item in the list.
struct ListItemView: View {
    var item: ListItem
    @EnvironmentObject var viewModel: ListViewModel
    @State private var isPresented: Bool = false
    
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
                            .font(.headline)
                        Spacer()
                        Image(systemName: item.isExpanded ? "chevron.down" : "chevron.right")
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel(Text("\(item.title), \(item.isExpanded ? "expanded" : "collapsed")"))
                    .accessibilityAddTraits(.isButton)
                }
                
                if item.isExpanded {
                    ForEach(subItems) { subItem in
                        ListItemView(item: subItem)
                            .padding(.leading, 20)
                            .environmentObject(viewModel)
                    }
                    .transition(.slide)
                }
            } else if case .link(let url) = item.type {
                NavigationLink(destination: WebView(url: URL(string: url)!)
                    .transition(.move(edge: .trailing))) {
                    HStack {
                        Text(item.title)
                            .font(.headline)
                        Spacer()
                        Image(systemName: "link")
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel(Text("\(item.title), link"))
                    .accessibilityAddTraits(.isLink)
                }
            }
        }
        .padding(.vertical, 5)
        .animation(.easeInOut)
    }
}



/*
#Preview {
    ListItemView()
}
*/



