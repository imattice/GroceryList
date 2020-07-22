//
//  Item.swift
//  GroceryList
//
//  Created by Ike Mattice on 10/24/19.
//  Copyright © 2019 Ike Mattice. All rights reserved.
//

import Foundation
import Plurals

struct Item: Identifiable, Hashable {
	var id: String 		= UUID().uuidString
	var name: String
	var variety: String?
	private var count: Int
	private var measurement: String
	var aisle: Aisle

	///A tuple containing the total remaining count of the item as well as the pluralized measurement label
	var quantity: (count: Int, measurement: String) {
		if self.count > 1 {
			return (count: count, measurement: measurement.plural())
		}
		return (count: count, measurement: measurement)
	}
	///A string containing both the variety and the name
	var label: String {
		var modifiedName: String {
			if count > 1 { return name.plural() } else { return name } }
		guard let variety = variety else { return modifiedName }
		return "\(variety) \(modifiedName)"
	}

	var isChecked: Bool

	init(name: String, quantity: (count: Int, measurement: String), variety: String?, aisle: Aisle, isChecked: Bool = false) {
		self.name 			= name
		self.variety		= variety
		self.aisle			= aisle
		self.isChecked		= isChecked
		self.count 			= quantity.count
		self.measurement	= quantity.measurement
	}
    
	init(name: String, count: Int, variety: String?, aisle: Aisle, isChecked: Bool = false) {
		self.init(name: name, quantity: (count: count, measurement: "individual"), variety: variety, aisle: aisle, isChecked: isChecked)
	}

	mutating
	func toggleCheck() {
		isChecked = !isChecked
	}
}



//enum State {
//case
//	fresh,
//	frozen,
//	canned,
//	dried
//}
