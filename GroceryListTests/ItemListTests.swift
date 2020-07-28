//
//  ItemListTests.swift
//  GroceryListTests
//
//  Created by Ike Mattice on 7/22/20.
//  Copyright © 2020 Ike Mattice. All rights reserved.
//

import XCTest
@testable import GroceryList



class ItemListTests: XCTestCase {

    func testAddItem() throws {
        var list = ItemList(items: [Item]())
        let item = Item(name: "Sample", count: 1, variety: nil, aisle: .produce)
        
        list.add(item)
        
        XCTAssertTrue(list.items.contains { $0.name == "Sample" })
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
