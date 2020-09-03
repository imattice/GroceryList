//
//  ItemRecord.swift
//  GroceryList
//
//  Created by Ike Mattice on 11/3/19.
//  Copyright © 2019 Ike Mattice. All rights reserved.
//

import Foundation
import CoreData

extension ItemRecord: Identifiable {
    
//    static func all() throws -> [ItemRecord] {
//        let request = NSFetchRequest<ItemRecord>(entityName: "ItemRecord")
//        let context = CoreDataStack(modelName: .Records).managedContext
//        let allRecords = try context.fetch(request)
//
//        return allRecords
//    }
//
//    static func search(_ searchString: String) throws -> [ItemRecord] {
//        let predicate = NSPredicate(format: "%K == %@", #keyPath(ItemRecord.name), searchString.lowercased())
//        let request = NSFetchRequest<ItemRecord>(entityName: "ItemRecord")
////        request.resultType = .managedObjectResultType
////        request.predicate = predicate
//        
//        var searchResult: [ItemRecord] = [ItemRecord]()
//        
//        do {
//            let fetchResult = try CoreDataStack(modelName: .Records).managedContext.fetch(request)
//            print(searchResult.last?.name)
//            
//            searchResult = fetchResult
//        } catch {
//            print(error)
//        }
//        
//        return searchResult
//    }
}

extension ItemRecord {
    // MARK: - Load JSON data to Core Data
    static func loadJSONItemDataIfNeeded(to context: NSManagedObjectContext) throws {
        //create a fetch request to see if there are any existing entries
        let fetchRequest = NSFetchRequest<ItemRecord>(entityName: "ItemRecord")
        let count = try! context.count(for: fetchRequest)
        
        //check if core data is empty.  If so, we don't need to load the JSON data
        guard count == 0 else { print("data is present"); return }

         do {
            //load the JSON data into Core Data
            try loadJSONItemData(to: context)
         } catch let error as NSError {
           print("Error fetching: \(error), \(error.userInfo)")
         }
    }

    private static
        func loadJSONItemData(to context: NSManagedObjectContext) throws {
        //grab the url for the json file
        guard let url = Bundle.main.url(forResource: "items",
                                    withExtension: "json")
        else { print("resource not found");
            throw ParsingError.fileNotFound(filepath: Bundle.main.url(forResource: "items", withExtension: "json")!)}

        do {
            //transform the json into data and serialize it into an array of dictionaries
            let data = try Data(contentsOf: url)
            guard let jsonArray = try JSONSerialization.jsonObject(with: data) as? [[String : Any]] else { return }
            
            //for each item in the data, map that entry to a property in a new ItemRecord. Return all the records in an array.
            let _: [ItemRecord] = jsonArray.compactMap {
                guard let name = $0["name"] as? String,
                    let aisle = $0["aisle"] as? String
                    else { return nil }
                //create the ItemRecord in the CoreData context
                let record = ItemRecord(context: context)
                record.name = name
                record.aisle = aisle
                record.id = UUID().uuidString

                return record
            }
            
            //save the context which now holds all of the ItemRecord entries
            try context.save()
            
            } catch {
                print("error:\(error)")
                throw error
            }
    }
}

