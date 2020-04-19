//
//  ItemData.swift
//  GroceryList
//
//  Created by Ike Mattice on 11/3/19.
//  Copyright © 2019 Ike Mattice. All rights reserved.
//

import Foundation

let itemData: [ItemRecord] = [
	ItemRecord(name: "allspice", aisle: .spices),
	ItemRecord(name: "almond butter"),
	ItemRecord(name: "apple", varieties: ["gala", "honeycrisp", "granny smith"], aisle: .produce)
]

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

struct CommonMeasurement {
	static let driedHerbs = [
		"default": "ounce",
		"selection": [
			"jar",
			"ounces",
			"teaspoon",
			"tablespoon",
			"gram"				]] as [String : Any]
	static let smallJar = [
		"default": "jar",
		"selection": [
			"ounce"				]] as [String : Any]
}

let testItems = [
	"allspice": [
		"aisle": "spices",
		"measurement" : CommonMeasurement.driedHerbs,
		"varieties": [
			"whole",
			"ground"										]],
	"almond butter": [
		"aisle": "peanut butter and jam",
		"measurement": CommonMeasurement.smallJar 			],
	"apple": [
		"aisle": "produce",
		"measurement": [
			"default": "individual"	],
		"varieties": [
			"gala",
			"granny smith"									]],
	"applesauce": [
		"aisle": "snacks and drinks",
		"measurement": CommonMeasurement.smallJar			],
	"barbeque sauce": [
		"aisle": "condiments",
		"measurement": CommonMeasurement.smallJar			],
	"basil, fresh": [
		"aisle": "produce",
		"measurement": [
			"default": "package",
			"selection": [
				"bunch",
				"cups"										]],
	"basil, dried": [
		"aisle": "spices",
		"measurement": CommonMeasurement.driedHerbs			],
	"banana": [
		"aisle": "produce",
		"measurement":  [
			"default": "individual",
			"selection": [
				"bunch"										]]],
	"bean": [
		"aisle": "canned",
		"varieties": [
			"black",
			"pinto",
			"kidney",
			"chickpeas"				]],
	"beef": [
		"aisle": "meat",
		"varieties": [
			"ground",
			"roast",				]],
	"bread": [
		"aisle": "bread",
		"varieties": [
			"sandwich",
			"hamburger buns",
			"baguette",
			"artisan"				]],
	"broccoli": [
		"aisle": "produce"			],
	"brussel sprouts": [
		"aisle": "produce"			],
	"butter": [
		"aisle": "dairy",
		"varieties": [
			"salted",
			"unsalted"				]],
	"cabbage": [
		"aisle": "produce"			],
	"cauliflower": [
		"aisle": "produce"			],
	"carrot": [
		"aisle": "produce"			],
	"cheese": [
		"aisle": "dairy",
		"varieties": [
			"cheddar",
			"cream",
			"mozzerella",			]],
	"cheese": [
		"aisle": "specialty cheese",
		"varieties": [
			"blue",
			"parmesan"				]],
	"chicken": [
		"aisle": "meat",
		"varieties": [
			"breast",
			"thigh",
			"wing",
			"drumstick",
			"whole"					]],
	"clemintines": [
		"aisle": "produce"			],
	"cinnamon": [
		"aisle": "spices"			],
	"corriander": [
		"aisle": "spices"			],
	"corn, frozen": [
		"aisle": "frozen"			],
	"corn, fresh": [
		"aisle": "produce"			],
	"eggs": [
		"aisle": "dairy"			],
	"flour": [
		"aisle": "baking",
		"varieties": [
			"bread",
			"almond",
			"buckwheat",
			"cake",
			"all purpose"			]],
	"garlic": [
		"aisle": "produce",			],
	"green onion": [
		"aisle": "produce"			],
	"honey": [
		"aisle": "peanut butter and jam"],
	"jam": [
		"aisle": "peanut butter and jam",
		"varieties": [
			"grape",
			"strawberry",
			"raspberry",
			"blueberry"				]],
	"kale": [
		"aisle": "produce"			],
	"ketchup": [
		"aisle": "condiment",		],
	"lemon": [
		"aisle": "produce"			],
	"lettuce": [
		"aisle": "produce",			],
	"lime": [
		"aisle": "produce"			],
	"mango": [
		"aisle": "produce"			],
	"milk": [
		"aisle": "dairy",
		"varieties" : [
			"almond",
			"oat",
			"skim",
			"whole",
			"2%"					]],
	"mushroms, fresh": [
		"aisle": "produce",
		"varieties": [
			"white",
			"crimini",
			"portobella",
			"oyster"				]],
	"mushroms, canned": [
		"aisle": "canned",			],
	"mustard": [
		"aisle": "condiment",
		"varieties": [
			"brown",
			"dijon"					],],
	"noodles": [
		"aisle": "pasta",
		"varieties": [
			"spaghetti",
			"bowtie",
			"angel hair",
			"lasagna",
			"maccaroni",
			"orchette"				]],
	"oatmeal": [
		"aisle": "cereal"			],
	"oranges": [
		"aisle": "produce",
		"varieties": [
		"navel",
		"blood"						]],
	"oil": [
		"aisle": "oil & vinegar",
		"varieties": [
			"olive",
			"canola",
			"peanut"				]],
	"onion": [
		"aisle": "produce",
		"varieties": [
			"white",
			"yellow",				]],
	"oregano, fresh": [
		"aisle": "produce"			],
	"oregano, dried": [
		"aisle": "spices",			],
	"parsley, fresh": [
		"aisle": "produce"			],
	"parsley, dried": [
		"aisle": "spices",			],
	"peach": [
		"aisle": "produce"			],
	"peas, frozen": [
		"aisle": "frozen"			],
	"peas, fresh": [
		"aisle": "produce"			],
	"peanut butter": [
		"aisle": "peanut butter and jam",],
	"pepper": [
		"aisle": "produce",
		"varieities": [
			"yellow bell",
			"red bell",
			"green bell",
			"bell",
			"jalapeño",
			"habenaro",
			"poblano"				]],
	"pineapple": [
		"aisle": "produce"			],
	"pineapple, canned": [
		"aisle": "canned"			],
	"potato": [
		"aisle": "root vegetables",
		"varieties":[
			"sweet",
			"red",
			"russet",				]],
	"salmon": [
		"aisle": "meat",
		"varieties": [
			"sockeye",
			"king"					]],
	"sour cream": [
		"aisle": "dairy"			],
	"star anise": [
		"aisle": "spices"			],
	"steak": [
		"aisle": "meat",
		"varieties": [
			"tri-tip",
			"ribeye"				]],
	"string beans": [
		"aisle": "produce"			],
	"sugar": [
		"aisle": "baking",
		"varieties": [
			"white",
			"brown",
			"powdered"				]],
	"tomato, canned": [
		"aisle": "canned",
		"varieties": [
			"diced",
			"crushed",
			"whole",				]],
	"tomato": [
		"aisle": "produce",
		"varieties": [
			"cherry",
			"grape",
			"hierloom",
			"roma",
			"slicing"				]],
	"tortillas": [
		"aisle": "hispanic foods"	],
	"thyme, fresh": [
		"aisle": "produce"			],
	"thyme, dried": [
		"aisle": "spices",			],
	"vanilla": [
		"aisle": "spices",
		"varieties": [
			"bean",
			"extract"				]],
	"vinegar": [
		"aisle": "oil & vinegar",
		"varieties": [
			"apple cider",
			"white",
			"balsamic",
			"red wine",
			"white wine",
			"sherry",				]],
	"water": [
		"aisle": "bottled drinks",
		"varieties": [
			"distilled",
			"coconut"				]],
	"wine": [
		"aisle": "wine",
		"varieties": [
			"white",
			"red",
			"rose",
			"sparkling",			]],
	]
] as [String : Any]
