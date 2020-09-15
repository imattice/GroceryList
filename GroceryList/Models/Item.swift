//
//  Item.swift
//  GroceryList
//
//  Created by Ike Mattice on 10/24/19.
//  Copyright © 2019 Ike Mattice. All rights reserved.
//

import Foundation
import CoreData
import UIKit
//import Plurals

extension Item: Identifiable {
//	var variety: String?

	///A tuple containing the total remaining count of the item as well as the pluralized measurement label
	var quantity: (count: Int, measurement: String) {
		if self.count > 1 {
			return (count: Int(count), measurement: measurement ?? "") //.plural())
		}
		return (count: Int(count), measurement: measurement ?? "")
	}
	///A string containing both the variety and the name
	var label: String {
//		var modifiedName: String {
//			if count > 1 { return name /*.plural()*/ } else { return name } }
//		guard let variety = variety else { return modifiedName }
//		return "\(variety) \(modifiedName)"
        
        return name!
	}

	func toggleCheck() {
		isChecked = !isChecked
	}
        
    func save(to context: NSManagedObjectContext) {
        context.insert(self)
        do {
            try context.save()
        } catch {
            print("failed to save to context")
        }
    }
    
    private static func deleteSampleItems(from context: NSManagedObjectContext) {
        print("deleting all item data")
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")

        if let entities = try? context.fetch(request) {
            for entity in entities {
                guard let entity = entity as? NSManagedObject else { print("could not cast to delete"); return }
                    context.delete(entity)
            }
            try? context.save()
        }
    }
    
    static func loadSampleItems(to context: NSManagedObjectContext) {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        
        deleteSampleItems(from: context)
        
        let dataCount = try? context.count(for: request)
                
        guard let count = dataCount, count == 0 else { print("sample list data is present"); return }
        
        let bread = Item(context: context)
        bread.name = "bread"
        bread.count = 3
        bread.measurement = "loaf"
        bread.aisle = "bread"
        bread.isChecked = false
        bread.id = UUID().uuidString
        
        let apple = Item(context: context)
        apple.name = "apple"
        apple.count = 4
        apple.measurement = ""
        apple.aisle = "produce"
        apple.isChecked = false
        apple.id = UUID().uuidString

        
        let cheese = Item(context: context)
        cheese.name = "cheese"
        cheese.count = 1
        cheese.measurement = "lbs"
        cheese.aisle = "dairy"
        cheese.isChecked = false
        cheese.id = UUID().uuidString

        
        let milk = Item(context: context)
        milk.name = "milk"
        milk.count = 1
        milk.measurement = "gallon"
        milk.aisle = "dairy"
        milk.isChecked = false
        milk.id = UUID().uuidString


        let tomato = Item(context: context)
        tomato.name = "tomato"
        tomato.count = 28
        tomato.measurement = "ounce"
        tomato.aisle = "canned"
        tomato.isChecked = false
        tomato.id = UUID().uuidString

        
        
        do{
            try context.save()
        } catch {
            print("unable to save sample items")
        }
        
        
    }
    
}
