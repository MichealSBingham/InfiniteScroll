//
//  ListViewModel.swift
//  InfiniteScroll
//
//  Created by Micheal Bingham on 6/19/24.
//

import Foundation
import Combine

class ListViewModel: ObservableObject {
    @Published var items: [ListItem] = []
    
    init() {
        load()
    }
    
    /// Adds mock data to the view model
    func load() {
        
        items = [
            ListItem(title: "Google", type: .link(url: "https://www.google.com")),
            ListItem(title: "Apple", type: .link(url: "https://www.apple.com")),
            ListItem(title: "Expand Folder", type: .folder(items: [
                ListItem(title: "Facebook", type: .link(url: "https://www.facebook.com")),
                ListItem(title: "Twitter", type: .link(url: "https://www.twitter.com"))
            ]))
        ]
    }
    
    func refresh() {
        
        let moreItems = [
            ListItem(title: "LinkedIn", type: .link(url: "https://www.linkedin.com")),
            ListItem(title: "Instagram", type: .link(url: "https://www.instagram.com"))
        ]
        items.append(contentsOf: moreItems)
    }
    
    func toggleExpansion(for item: ListItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isExpanded.toggle()
        }
    }
}
