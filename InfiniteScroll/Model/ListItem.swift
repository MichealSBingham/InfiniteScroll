//
//  ListItem.swift
//  InfiniteScroll
//
//  Created by Micheal Bingham on 6/19/24.
//

import SwiftUI
import Foundation

enum ListItemType: Equatable {
    case link(url: String)
    case folder(items: [ListItem])
}

struct ListItem: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let type: ListItemType
    var isExpanded: Bool = false
    
    static func ==(lhs: ListItem, rhs: ListItem) -> Bool {
        return lhs.id == rhs.id
    }
}


