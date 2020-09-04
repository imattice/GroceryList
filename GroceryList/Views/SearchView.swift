//
//  SearchResults.swift
//  GroceryList
//
//  Created by Ike Mattice on 3/6/20.
//  Copyright © 2020 Ike Mattice. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @Environment(\.managedObjectContext) var recordContext

    @Binding var isPresented: Bool
    @Binding var list: ItemList

    @State private var searchText: String = ""
    @FetchRequest(entity: ItemRecord.entity(), sortDescriptors: [])
//    @FetchRequest(entity: ItemRecord.entity(),
//                  sortDescriptors: [],
//                  predicate: NSPredicate(format: "%K == %@", #keyPath(ItemRecord.name), "apple"))
//    var results: [ItemRecord] = { try! ItemRecord.search(searchText) }()
    var results: FetchedResults<ItemRecord>
        
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding(.top)
                List {
                    //POSSIBLE CRASH: Force Unwrapping the name here might cause a crash.  Check here if filter view is crashing
                    //Filter is not needed if we only return matched results
                    //                        .filter { $0.name!.contains(searchText.lowercased()) || searchText == "" },
                    //                            id: \.self

                    ForEach(results) { searchResult in
                                Button(
                                    action: {
                                        let resultName = searchResult.name ?? "Unnamed Item"
                                        let resultAisle = Aisle(rawValue: searchResult.aisle!)!
                                        let resultItem = Item(name: resultName, count: 1, variety: nil,
                                                              aisle: resultAisle)
                                        self.list.add(resultItem)
                                },
                                    label: {
                                        //POSSIBLE CRASH: See Force Unwrapping note above
                                        Text(searchResult.name!.capitalized)
                                })
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
    @State static var previewList = ItemList()
    static var previews: some View {
        SearchView(isPresented: .constant(true), list: $previewList)
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
