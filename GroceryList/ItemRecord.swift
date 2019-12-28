//
//  ItemRecord.swift
//  GroceryList
//
//  Created by Ike Mattice on 11/3/19.
//  Copyright © 2019 Ike Mattice. All rights reserved.
//

import Foundation

struct ItemRecord {
	var id: String 				= UUID().uuidString
	let name: String
	let varieties: [String]
	let aisle: Aisle

	init(name: String, varieties: [String], aisle: Aisle) {
		self.name 		= name
		self.varieties	= varieties
		self.aisle		= aisle								}
	init(name: String, aisle: Aisle) {
		self.init(name: name, varieties: [String](), aisle: aisle)}
	init(name: String) {
		self.init(name: name, varieties: [String](), aisle: .other)
	}

	
}

enum Aisle: String {
case
	produce,
	spices,
	peanutButterAndJam,
	condiments,
	canned,
	meat,
	bread,
	dairy,
	specialtyCheese,
	wine,
	frozen,
	baking,
	pasta,
	oilAndVinegar,
	snacksAndDrinks,
	other,
	bulk,
	cleaningSupplies
}

