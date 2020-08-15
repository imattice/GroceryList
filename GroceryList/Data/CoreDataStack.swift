//
//  CoreDataStack.swift
//  GroceryList
//
//  Created by Ike Mattice on 8/13/20.
//  Copyright © 2020 Ike Mattice. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    ///The name of the core data model file that contains the entities
    private let modelName: String
    ///An enum used to point to the core data model files
    enum DataStore: String {
        case Records, ListData
    }
    
    ///Create a reference to the data store
    init(modelName: DataStore) {
        self.modelName = modelName.rawValue
    }
    
    lazy
    var managedContext: NSManagedObjectContext = {
        return self.storeContainer.viewContext          }()

    private lazy
    var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    ///save the current context to the data model
    func saveContext () {
        //ensure that there were changes made
        guard managedContext.hasChanges else { print("no changes to context"); return }
        
        do {
            try managedContext.save()
        } catch let nserror as NSError {
            print("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}

