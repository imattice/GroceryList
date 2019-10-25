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
//	var quantity: Int
//	var measurement: Measurement
//	var variety: Variety?
//	var aisle: Aisle?
//	var notes: String?

	var isChecked: Bool = false

	mutating
	func toggleCheck() {
		isChecked = !isChecked
	}
}
