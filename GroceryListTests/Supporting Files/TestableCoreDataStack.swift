//
//  TestableCoreDataStack.swift
//  GroceryListTests
//
//  Created by Ike Mattice on 9/16/20.
//  Copyright © 2020 Ike Mattice. All rights reserved.
//

import Foundation
import CoreData
@testable import GroceryList


///An In-memory data store that will be cleared each time a test is run
class TestableCoreDataStack: CoreDataStack {
    let modelName: String = "CoreData"
    
    override init() {
        super.init()
       
        //set the store to be an in-memory store type
        let persistentStoreDescription = NSPersistentStoreDescription()
        persistentStoreDescription.type = NSInMemoryStoreType

        //set the store description to the persistent container
        let container = NSPersistentContainer(name: TestableCoreDataStack.modelName, managedObjectModel: model )
        container.persistentStoreDescriptions = [persistentStoreDescription]
        container.loadPersistentStores { (_, error) in if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")  } }

        self.storeContainer = container
    }
}
