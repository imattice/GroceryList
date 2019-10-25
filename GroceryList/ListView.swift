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
	@State var items: [Item]				= [Item]()

    var body: some View {
		NavigationView {
			VStack {
				TextField("New item", text: $newItem)
					.padding(.horizontal)
				List {
					ForEach(items) { item in
						ListRowView(item: item)
					}
				}
			}
//		.navigationBarTitle("Title")
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
//		let sampleItems =
        ListView(newItem: "",
				 items: [
					Item(name: "Apple"),
					Item(name: "Orange"),
					Item(name: "Bread")		])
    }
}
