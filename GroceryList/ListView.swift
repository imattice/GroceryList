//
//  ContentView.swift
//  GroceryList
//
//  Created by Ike Mattice on 10/24/19.
//  Copyright © 2019 Ike Mattice. All rights reserved.
//

import SwiftUI

struct ListView: View {
	@State var newItem: String 				= "Item Here"
	@State var items: [String]				= ["Apples", "Oranges", "Potatoes"]

    var body: some View {
		NavigationView {
			VStack {
				TextField("New item", text: $newItem)
					.padding(.horizontal)
//				List(items) { item in
//					Text(item)
//				}
			}
		.navigationBarTitle("Title")
		.navigationBarItems(
			leading: Button(action: {
				print("Settings Button Tapped") })
				{ Image(systemName: "gear") },
			trailing: Button(action: {
				print("Sort Button Tapped") })
				{ Image(systemName: "list.dash") })
		}
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
