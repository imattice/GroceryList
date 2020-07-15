//
//  SearchResults.swift
//  GroceryList
//
//  Created by Ike Mattice on 3/6/20.
//  Copyright © 2020 Ike Mattice. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @Binding var isPresented: Bool

    @State private var searchText: String = ""
    @State var results: [ItemRecord] = { try! ItemRecord.all() }()
        
//        [
//    Item(name: "banana", count: 3, variety: nil, aisle: .produce),
//    Item(name: "apple", count: 4, variety: "gala", aisle: .produce),
//    Item(name: "orange", count: 1, variety: nil, aisle: .produce),
//    Item(name: "pineapple", count: 1, variety: "cubed", aisle: .produce),
//    Item(name: "applesauce", count: 1, variety: "jar", aisle: .produce)]
        
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding(.top)
                List {
                    ForEach(results
                        .filter { $0.name.contains(searchText.lowercased()) || searchText == "" },
                            id: \.self) { searchResult in
                        Text(searchResult.name.capitalized)
                    }
                }
                .gesture(DragGesture().onChanged { _ in
                    UIApplication.shared.endEditing(true)
                })
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(
                trailing: Button(
                    action: { self.isPresented = false },
                    label:  { Image(systemName: "xmark").foregroundColor(.blue).font(.largeTitle) }))
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(isPresented: .constant(true))
    }
}


//https://medium.com/better-programming/build-a-search-view-in-swiftui-e6d0d29d60f8
struct SearchBar: View {
    @Binding var text: String
    var placeholder: String = "Search"

    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")

                TextField(placeholder, text: $text)
                    .foregroundColor(.primary)

                if !text.isEmpty {
                    Button(action: {
                        self.text = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                    }
                } else {
                    EmptyView()
                }
            }
            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)
        }
        .padding(.horizontal)
    }
}
