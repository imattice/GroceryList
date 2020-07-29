//
//  ItemRecord.swift
//  GroceryList
//
//  Created by Ike Mattice on 11/3/19.
//  Copyright © 2019 Ike Mattice. All rights reserved.
//

import Foundation

struct ItemRecord: Hashable {
	var id: String 				= UUID().uuidString
	let name: String
//	let varieties: [String]
	let aisle: Aisle

	init(name: String, varieties: [String], aisle: Aisle) {
		self.name 		= name
//		self.varieties	= varieties
		self.aisle		= aisle								}
	init(name: String, aisle: Aisle) {
		self.init(name: name, varieties: [String](), aisle: aisle)}
	init(name: String) {
		self.init(name: name, varieties: [String](), aisle: .other)
	}
//    init(from decoder: Decoder) throws {
//
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let name = try container.
//
//    }
    
    static func all() throws -> [ItemRecord] {
        guard let url = Bundle.main.url(forResource: "items",
                                    withExtension: "json")
        else { print("resource not found");
            throw ParsingError.fileNotFound(filepath: Bundle.main.url(forResource: "race", withExtension: "json")!)}
        
        do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
            
                let jsonData = try decoder.decode([ItemRecord].self,
                                                  from: data)
                return jsonData
            } catch {
                print("error:\(error)")
                throw error
            }
    }
    

}

extension ItemRecord: Codable {
    init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let name = try container.decode(String.self, forKey: .name)
//            let varieties = try container.decode([String].self, forKey: .varieties)
            let aisle = try container.decode(Aisle.self, forKey: .aisle)

            self.init(name: name, aisle: aisle)
        } catch {
            print("Decoding error:\(error)")
            throw error
        }
    }
    
    enum CodingKeys: CodingKey {
        case name, aisle
    }
}

enum Aisle: String, Codable {
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

