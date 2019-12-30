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
	private var count: Int
	private var measurement: String
//	var quantity: (count: Int, measurement: String)
//	var measurement: Measurement
	var variety: String?
	var aisle: Aisle
//	var notes: String?

	var quantity: (count: Int, measurement: String) {
		if self.count > 1 {
			return (count: count, measurement: measurement.pluralize())
		}
		return (count: count, measurement: measurement)
	}

	var isChecked: Bool

	init(name: String, quantity: (count: Int, measurement: String), variety: String?, aisle: Aisle, isChecked: Bool = false) {
		self.name 			= name
		self.variety		= variety
		self.aisle			= aisle
		self.isChecked		= isChecked
		self.count 			= quantity.count
		self.measurement	= quantity.measurement

//		if quantity.count > 1 {
//			self.quantity	= (count: quantity.count, measurement: quantity.measurement.pluralize()) }
//		else {
//			self.quantity 	= (count: quantity.count, measurement: quantity.measurement) }

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
