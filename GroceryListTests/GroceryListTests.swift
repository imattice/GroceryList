//
//  GroceryListTests.swift
//  GroceryListTests
//
//  Created by Ike Mattice on 10/24/19.
//  Copyright © 2019 Ike Mattice. All rights reserved.
//

import XCTest
@testable import GroceryList

class ItemRecordTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testJSONDecoding() {
        let banana = ItemRecord(name: "banana", aisle: .produce)
        let allItems = try! ItemRecord.all()
        
        XCTAssertEqual(banana.name, allItems[0].name)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
