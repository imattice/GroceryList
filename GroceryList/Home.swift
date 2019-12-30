//
//  ContentView.swift
//  GroceryList
//
//  Created by Ike Mattice on 10/24/19.
//  Copyright © 2019 Ike Mattice. All rights reserved.
//

import SwiftUI

struct Home: View {
	@State var newItem: String 				= "Item Here"
	@State var items: [Item]				= [Item]()

    var body: some View {
		NavigationView {
			VStack {
				TextField("New item", text: $newItem)
					.padding(.horizontal)
				List {
					ForEach(items) { item in
						ListRow(item: item)
					}
				
				}
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



struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
//		let sampleItems =
        Home(newItem: "",
				 items: [sampleList[0],sampleList[1],sampleList[2]])
    }
}