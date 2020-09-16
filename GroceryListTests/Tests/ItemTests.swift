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

    func testFetchAllItems() throws {
        let request = NSFetchRequest<Item>(entityName: "Item")
                
        let count = try! coreDataStack.managedContext.count(for: request)
        
        XCTAssertEqual(count, 5)        
    }
    
    
    //MARK: - Set up and Tear Down
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        coreDataStack = TestableCoreDataStack()
        
        Item.loadSampleItems(to: coreDataStack.managedContext)
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        coreDataStack = nil
    }


}
