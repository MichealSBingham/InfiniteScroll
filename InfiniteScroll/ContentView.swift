//
//  ContentView.swift
//  InfiniteScroll
//
//  Created by Micheal Bingham on 6/19/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.items) { item in
                    ListItemView(item: item, viewModel: viewModel)
                        .onAppear {
                            if viewModel.items.last == item {
                                // load more data if we reach the end
                                viewModel.refresh()
                            }
                        }
                }
            }
            .navigationTitle("Links and Folders")
            .onAppear {
                UITableView.appearance().backgroundColor = .clear
            }
        }
    }
}






#Preview {
    ContentView()
}
