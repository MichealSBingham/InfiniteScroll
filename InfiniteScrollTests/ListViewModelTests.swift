//
//  ListViewModelTests.swift
//  InfiniteScrollTests
//
//  Created by Micheal Bingham on 6/19/24.
//

import XCTest
@testable import InfiniteScroll

class ListViewModelTests: XCTestCase {
    var viewModel: ListViewModel!

    override func setUp() {
        super.setUp()
        viewModel = ListViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testLoadMockData() {
        XCTAssertEqual(viewModel.items.count, 3)
    }

    func testToggleExpansion() {
        let folderItem = viewModel.items[2]
        XCTAssertFalse(folderItem.isExpanded)

        viewModel.toggleExpansion(for: folderItem)

        XCTAssertTrue(viewModel.items[2].isExpanded)
    }

    func testLoadMoreData() {
        let initialCount = viewModel.items.count
        viewModel.refresh()
        
        XCTAssertEqual(viewModel.items.count, initialCount + 2)
    }
}
