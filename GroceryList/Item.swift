//
//  Item.swift
//  GroceryList
//
//  Created by Ike Mattice on 10/24/19.
//  Copyright © 2019 Ike Mattice. All rights reserved.
//

import Foundation

struct Item: Identifiable {
	var id: String 		= UUID().uuidString
	var name: String
	var quantity: (count: Int, measurement: String)
//	var measurement: Measurement
	var variety: String?
	var aisle: Aisle
//	var notes: String?

	var isChecked: Bool

	init(name: String, quantity: (count: Int, measurement: String), variety: String?, aisle: Aisle, isChecked: Bool = false) {
		self.name 		= name
		self.quantity	= quantity
		self.variety	= variety
		self.aisle		= aisle

		self.isChecked	= isChecked
	}
	init(name: String, count: Int, variety: String?, aisle: Aisle, isChecked: Bool = false) {
		self.name 		= name
		self.quantity	= (count: count, measurement: "individual")
		self.variety	= variety
		self.aisle		= aisle

		self.isChecked	= isChecked
	}
//	init(name: String, quantity: (count: Int, measurement: String), variety: String?, aisle: Aisle) {
//		self.name 		= name
//		self.quantity	= quantity
//		self.variety	= variety
//		self.aisle		= aisle
//
//		self.isChecked	= false
//	}

	func measurement() -> String {
		var result = String(quantity.count)

		return result
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
