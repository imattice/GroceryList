//
//  ItemTests.swift
//  GroceryListTests
//
//  Created by Ike Mattice on 9/16/20.
//  Copyright © 2020 Ike Mattice. All rights reserved.
//

import XCTest
import CoreData
@testable import GroceryList


class ItemTests: XCTestCase {
    var coreDataStack: TestableCoreDataStack!
    lazy var testContext: NSManagedObjectContext = coreDataStack.managedContext

    func testFetchAllItems() {
        let allItems = Item.all(coreDataStack.managedContext)
        print(allItems)
        XCTAssertEqual(allItems.count, 5)
    }
    
    func testAislesForList() {
        
        let aisles = Item.aisles() //in: coreDataStack.managedContext)
                
        let hasDuplicates: Bool = {
            let set = NSCountedSet(array: aisles)
            var dictionary: [String : Int] = [String : Int]()
           
            aisles.forEach { (aisle) in
                dictionary[aisle] = set.count(for: aisle)
            }
            
            for (key, value) in dictionary {
                if value > 1 {
                    print("duplicated value: \(key) : \(value)")
                    return true }
            }
            return false
        }()
        
        print(aisles)
        
        XCTAssertTrue(aisles.contains("bread"))
        XCTAssertTrue(aisles.contains("produce"))
        XCTAssertTrue(aisles.contains("dairy"))
        XCTAssertTrue(aisles.contains("canned"))
        XCTAssertFalse(aisles.contains("other"))
        XCTAssertFalse(aisles.contains("frozen"))
        XCTAssertFalse(hasDuplicates)
    }
    
    func testGroupedList() {
        let groupedList = Item.groupedList(coreDataStack.managedContext)
                
        //test there are only four aisles in the sample data
        XCTAssertTrue(groupedList.keys.count == 4)
        XCTAssertTrue(groupedList["dairy"]?.count == 2)
    }
    
    
    //MARK: - Set up and Tear Down
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        coreDataStack = TestableCoreDataStack()
        
        Item.loadSampleItems(coreDataStack.managedContext)
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        coreDataStack = nil
    }


}
