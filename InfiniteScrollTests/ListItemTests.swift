//
//  ListItemTests.swift
//  InfiniteScrollTests
//
//  Created by Micheal Bingham on 6/19/24.
//

import XCTest
@testable import InfiniteScroll

class ListItemTests: XCTestCase {

    func testListItemEquality() {
        let item1 = ListItem(title: "Google", type: .link(url: "https://www.google.com"))
        let item2 = ListItem(title: "Google", type: .link(url: "https://www.google.com"))
        
        XCTAssertEqual(item1, item2)
    }

    func testListItemInequality() {
        let item1 = ListItem(title: "Google", type: .link(url: "https://www.google.com"))
        let item2 = ListItem(title: "Apple", type: .link(url: "https://www.apple.com"))
        
        XCTAssertNotEqual(item1, item2)
    }

    func testListItemFolder() {
        let subItem1 = ListItem(title: "Facebook", type: .link(url: "https://www.facebook.com"))
        let subItem2 = ListItem(title: "Twitter", type: .link(url: "https://www.twitter.com"))
        
        let folder = ListItem(title: "Expand Folder", type: .folder(items: [subItem1, subItem2]))
        
        if case .folder(let items) = folder.type {
            XCTAssertEqual(items.count, 2)
        } else {
            XCTFail("Expected folder type")
        }
    }
}
