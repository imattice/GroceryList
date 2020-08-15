//
//  ItemData.swift
//  GroceryList
//
//  Created by Ike Mattice on 11/3/19.
//  Copyright © 2019 Ike Mattice. All rights reserved.
//

import Foundation

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
