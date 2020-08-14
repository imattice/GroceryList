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

  private let modelName: String

  init(modelName: String) {
    self.modelName = modelName
  }

  lazy var managedContext: NSManagedObjectContext = {
    return self.storeContainer.viewContext
  }()

  private lazy var storeContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: self.modelName)
    container.loadPersistentStores { (storeDescription, error) in
      if let error = error as NSError? {
        print("Unresolved error \(error), \(error.userInfo)")
      }
    }
    return container
  }()

  func saveContext () {
    guard managedContext.hasChanges else { return }

    do {
      try managedContext.save()
    } catch let nserror as NSError {
      print("Unresolved error \(nserror), \(nserror.userInfo)")
    }
  }
}

extension CoreDataStack {
    // MARK: - Load JSON data to Core Data
//    func loadJSONDataIfNeeded() throws {
//        let fetchRequest = NSFetchRequest<ItemRecord>(entityName: "ItemRecord")
//        
//         let count = try! coreDataStack.managedContext.count(for: fetchRequest)
//
//         guard count == 0 else { return }
//
//         do {
//           let results = try coreDataStack.managedContext.fetch(fetchRequest)
//           results.forEach { coreDataStack.managedContext.delete($0) }
//
//           coreDataStack.saveContext()
//           importJSONSeedData()
//         } catch let error as NSError {
//           print("Error fetching: \(error), \(error.userInfo)")
//         }
//        
//        
//        guard let url = Bundle.main.url(forResource: "items",
//                                    withExtension: "json")
//        else { print("resource not found");
//            throw ParsingError.fileNotFound(filepath: Bundle.main.url(forResource: "race", withExtension: "json")!)}
//        
//        do {
//                let data = try Data(contentsOf: url)
//                let decoder = JSONDecoder()
//            
//                let jsonData = try decoder.decode([ItemRecord].self,
//                                                  from: data)
//                return jsonData
//            } catch {
//                print("error:\(error)")
//                throw error
//            }
//    }
}
//
//
//func importJSONSeedDataIfNeeded() {
//  let fetchRequest = NSFetchRequest<Venue>(entityName: "Venue")
//  let count = try! coreDataStack.managedContext.count(for: fetchRequest)
//
//  guard count == 0 else { return }
//
//  do {
//    let results = try coreDataStack.managedContext.fetch(fetchRequest)
//    results.forEach { coreDataStack.managedContext.delete($0) }
//
//    coreDataStack.saveContext()
//    importJSONSeedData()
//  } catch let error as NSError {
//    print("Error fetching: \(error), \(error.userInfo)")
//  }
//}
//
//func importJSONSeedData() {
//  let jsonURL = Bundle.main.url(forResource: "seed", withExtension: "json")!
//  let jsonData = try! Data(contentsOf: jsonURL)
//
//  let jsonDict = try! JSONSerialization.jsonObject(with: jsonData, options: [.allowFragments]) as! [String: Any]
//  let responseDict = jsonDict["response"] as! [String: Any]
//  let jsonArray = responseDict["venues"] as! [[String: Any]]
//
//  for jsonDictionary in jsonArray {
//    let venueName = jsonDictionary["name"] as? String
//    let contactDict = jsonDictionary["contact"] as! [String: String]
//
//    let venuePhone = contactDict["phone"]
//
//    let specialsDict = jsonDictionary["specials"] as! [String: Any]
//    let specialCount = specialsDict["count"] as? NSNumber
//
//    let locationDict = jsonDictionary["location"] as! [String: Any]
//    let priceDict = jsonDictionary["price"] as! [String: Any]
//    let statsDict =  jsonDictionary["stats"] as! [String: Any]
//
//    let location = Location(context: coreDataStack.managedContext)
//    location.address = locationDict["address"] as? String
//    location.city = locationDict["city"] as? String
//    location.state = locationDict["state"] as? String
//    location.zipcode = locationDict["postalCode"] as? String
//    let distance = locationDict["distance"] as? NSNumber
//    location.distance = distance!.floatValue
//
//    let category = Category(context: coreDataStack.managedContext)
//
//    let priceInfo = PriceInfo(context: coreDataStack.managedContext)
//    priceInfo.priceCategory = priceDict["currency"] as? String
//
//    let stats = Stats(context: coreDataStack.managedContext)
//    let checkins = statsDict["checkinsCount"] as? NSNumber
//    stats.checkinsCount = checkins!.int32Value
//    let tipCount = statsDict["tipCount"] as? NSNumber
//    stats.tipCount = tipCount!.int32Value
//
//    let venue = Venue(context: coreDataStack.managedContext)
//    venue.name = venueName
//    venue.phone = venuePhone
//    venue.specialCount = specialCount!.int32Value
//    venue.location = location
//    venue.category = category
//    venue.priceInfo = priceInfo
//    venue.stats = stats
//  }
//
//  coreDataStack.saveContext()
//}
//}

