//
//  ContentView.swift
//  GroceryList
//
//  Created by Ike Mattice on 10/24/19.
//  Copyright © 2019 Ike Mattice. All rights reserved.
//

import SwiftUI

struct Home: View {
	@State var newItem: String              = "+ New Item"
	@State var items: [Item]				= [Item]()
    @State var searchIsActive: Bool         = false

    var body: some View {
		NavigationView {
            ZStack {
			VStack {
//                TextField("New item", text: $newItem)
//					.padding(.horizontal)
//                SearchBar(text: $newItem)
                    
				List {
					ForEach(items) { item in
						ListRow(item: item)
					}
                }
                Button(action:
                    { self.searchIsActive = true },
                       label:
                    {
                        ZStack {
                            Color(.blue)
                                .clipShape(Circle())
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                        }
                            .frame(width: 50, height: 50)
                    .padding()
                }).sheet(isPresented: $searchIsActive) {
                    SearchView(isPresented: self.$searchIsActive)
                }
			}
		.navigationBarItems(
			leading: Button(action: {
				NewRelic.crashNow()
				print("Settings Button Tapped") })
				{ Image(systemName: "gear") },
			trailing: Button(action: {
				print("Sort Button Tapped") })
				{ Image(systemName: "list.dash") })
		}
    }
    }
}



struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
        Home(newItem: "",
				 items: sampleList)
    }
}
