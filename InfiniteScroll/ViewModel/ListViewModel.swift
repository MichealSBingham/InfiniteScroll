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
    /// Adds more items to simulate a refresh
    func refresh() {
        let moreItems = generateRandomItems()
        items.append(contentsOf: moreItems)
    }
    
    /// Function to return some random data to use for the list 
    private func generateRandomItems() -> [ListItem] {
        var newItems: [ListItem] = []
        
        let titles = ["LinkedIn", "Instagram", "Reddit", "GitHub", "YouTube", "StackOverflow", "Microsoft", "Amazon"]
        let urls = ["https://www.linkedin.com", "https://www.instagram.com", "https://www.reddit.com", "https://www.github.com", "https://www.youtube.com", "https://stackoverflow.com", "https://www.microsoft.com", "https://www.amazon.com"]
        
        for _ in 0..<4 {
            if Bool.random() {
                // Add a link item
                let randomIndex = Int.random(in: 0..<titles.count)
                let linkItem = ListItem(title: titles[randomIndex], type: .link(url: urls[randomIndex]))
                newItems.append(linkItem)
            } else {
                // Add a folder item
                let folderItems: [ListItem] = (0..<2).map { _ in
                    let randomIndex = Int.random(in: 0..<titles.count)
                    return ListItem(title: titles[randomIndex], type: .link(url: urls[randomIndex]))
                }
                let folderItem = ListItem(title: "Folder \(Int.random(in: 1...100))", type: .folder(items: folderItems))
                newItems.append(folderItem)
            }
        }
        
        return newItems
    }


    

    
    
    /**
         Toggles the expansion state of a given folder item.
         
         - Parameter item: The `ListItem` to toggle.
         */
    func toggleExpansion(for item: ListItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isExpanded.toggle()
        }
    }
}
