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


    fileprivate
	convenience init(name: String, quantity: (count: Int, measurement: String), variety: String?, aisle: Aisle, isChecked: Bool = false) {
        self.init()
		self.name 			= name
//		self.variety		= variety
        self.aisle			= aisle.rawValue
		self.isChecked		= isChecked
		self.count 			= Int32(quantity.count)
		self.measurement	= quantity.measurement
        
//        let item = Item(context: context)
//
//        item.name             = name
////        self.variety        = variety
//        item.aisle            = aisle.rawValue
//        item.isChecked        = isChecked
//        item.count             = Int16(quantity.count)
//        item.measurement    = quantity.measurement
	}

    fileprivate
    convenience init(name: String, count: Int, variety: String?, aisle: Aisle, isChecked: Bool = false) {
		self.init(name: name, quantity: (count: count, measurement: "individual"), variety: variety, aisle: aisle, isChecked: isChecked)
	}

	func toggleCheck() {
		isChecked = !isChecked
	}
    
    func save() {
        guard let appContext = (UIApplication.shared.delegate as? AppDelegate)?.coreDataStack.managedContext else {
            print("could not access app context during item save operation"); return }
        
        appContext.insert(self)
        do {
            try appContext.save()
        } catch {
            print("failed to save to context")
        }
    }
    
    static func loadSampleItems(to context: NSManagedObjectContext) {
        let sampleList: [Item] = [
            Item(name: "bread", quantity: (count: 3, measurement: "loaf"), variety: "white", aisle: .bread, isChecked: false),
            Item(name: "apple", count: 4, variety: "gala", aisle: .produce, isChecked: false),
            Item(name: "bean", quantity: (count: 15, measurement: "ounce"), variety: "black", aisle: .canned, isChecked: false),
            Item(name: "basil", quantity: (count: 2, measurement: "package"), variety: nil, aisle: .produce, isChecked: true),
            Item(name: "orange", count: 3, variety: nil, aisle: .produce, isChecked: false),
            Item(name: "banana", quantity: (count: 1, measurement: "bunch"), variety: nil, aisle: .produce, isChecked: true),
            Item(name: "ice cream", quantity: (count: 1, measurement: "quart"), variety: "cookies and cream", aisle: .frozen, isChecked: false),
            Item(name: "cheese", quantity: (count: 1, measurement: "pound"), variety: "cheddar", aisle: .dairy, isChecked: false),
            Item(name: "milk", quantity: (count: 1, measurement: "gallon"), variety: "2%", aisle: .dairy, isChecked: false),
            Item(name: "mayonaise", quantity: (count: 1, measurement: "jar"), variety: nil, aisle: .condiments, isChecked: true),
            Item(name: "peanut butter", quantity: (count: 15, measurement: "ounce"), variety: nil, aisle: .peanutButterAndJam),
            Item(name: "almond butter", quantity: (count: 1, measurement: "jar"), variety: nil, aisle: .peanutButterAndJam, isChecked: true),
            Item(name: "butter", quantity: (count: 1, measurement: "pound"), variety: nil, aisle: .dairy, isChecked: true),
            Item(name: "dishwaher detergent", count: 1, variety: "powdered", aisle: .cleaningSupplies, isChecked: false),
            Item(name: "laundry detergent", count: 1, variety: nil, aisle: .cleaningSupplies, isChecked: false),
            Item(name: "tomato", quantity: (count: 28, measurement: "ounce"), variety: "canned", aisle: .canned, isChecked: false),
            Item(name: "tomato", count: 3, variety: "fresh", aisle: .produce, isChecked: false)
        ]
        
        for item in sampleList {
            context.insert(item)
        }
        do{
            try context.save()
        } catch {
            print("unable to save sample items")
        }
        
        
    }
    
}
