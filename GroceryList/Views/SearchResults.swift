//
//  SearchResults.swift
//  GroceryList
//
//  Created by Ike Mattice on 3/6/20.
//  Copyright © 2020 Ike Mattice. All rights reserved.
//

import SwiftUI

struct SearchResults: View {
    @State var searchString: String = ""
    @State var results: [Item] = [Item]()
    
    var body: some View {
        ForEach(results, id: \.self) { result in
            ListRow(item: result)
        }
    }
}

struct SearchResults_Previews: PreviewProvider {
    static var previews: some View {
        SearchResults(searchString: "", results: [
        Item(name: "banana", count: 3, variety: nil, aisle: .produce),
        Item(name: "apple", count: 4, variety: "gala", aisle: .produce),
        Item(name: "orange", count: 1, variety: nil, aisle: .produce),
        Item(name: "pineapple", count: 1, variety: "cubed", aisle: .produce),
        Item(name: "applesauce", count: 1, variety: "jar", aisle: .produce)])
    }
}
