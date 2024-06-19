//
//  ListItem.swift
//  InfiniteScroll
//
//  Created by Micheal Bingham on 6/19/24.
//

import SwiftUI
import Foundation

/// Represents a type of list item.
enum ListItemType: Equatable {
    case link(url: String)
    case folder(items: [ListItem])
}

/// Represents an item in the list.
struct ListItem: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let type: ListItemType
    var isExpanded: Bool = false
    
    
    static func ==(lhs: ListItem, rhs: ListItem) -> Bool {
        
        return lhs.title == rhs.title && lhs.type == rhs.type && lhs.isExpanded == rhs.isExpanded
        
    }

}


