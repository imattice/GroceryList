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
    static let modelName: String = "CoreData"
    
    ///The reference to the data model file
    let model: NSManagedObjectModel = {
        let modelURL = Bundle.main.url(forResource: modelName, withExtension: "momd")!
      return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    ///A singleton Data Stack to be used throughout the app
    static let shared = CoreDataStack()
    
    lazy
    var managedContext: NSManagedObjectContext = {
        return self.storeContainer.viewContext          }()
    
    lazy
    var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: CoreDataStack.modelName)
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


