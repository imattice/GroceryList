//
//  List.swift
//  GroceryList
//
//  Created by Ike Mattice on 7/22/20.
//  Copyright © 2020 Ike Mattice. All rights reserved.
//

import Foundation

struct ItemList {
    let id: String = UUID().uuidString
    var items: [Item]
    
    mutating func add(_ item: Item) {
        items.append(item)
    }
    
    init() {
        self.items = [Item]()
    }
    
    init(items: [Item]) {
        self.items = items
    }
}
