//
//  ContentView.swift
//  GroceryList
//
//  Created by Ike Mattice on 10/24/19.
//  Copyright © 2019 Ike Mattice. All rights reserved.
//

import SwiftUI

struct Home: View {
    @Environment(\.managedObjectContext) var recordContext
    @FetchRequest(entity: Item.entity(), sortDescriptors: []) var list: FetchedResults<Item>

	@State var newItem: String              = "+ New Item"
    @State var searchIsActive: Bool         = false
    
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
    
    var body: some View {
		NavigationView {
            ZStack {
			VStack {
                ///Results List
				List {
                    ForEach(Array(list)) { item in
                        self.Print(item)
                        ListRow(item: item)
					}
                }
                
                ///Add Item Button
                NewItemButton(searchIsActive: $searchIsActive)
                    .environment(\.managedObjectContext, self.recordContext)

			}
        
        ///Navigation Options
        .navigationBarTitle("", displayMode: .inline)
		.navigationBarItems(
			leading: Button(action: {
                print("crashing")
                NewRelic.crashNow()
				print("Settings Button Tapped") })
				{ Image(systemName: "gear") },
			trailing: Button(action: {
				print("Sort Button Tapped") })
				{ Image(systemName: "list.dash") })
		}
    }
    }
    
    struct NewItemButton: View {
        @Environment(\.managedObjectContext) var recordContext

        @Binding var searchIsActive: Bool
//        @Binding var listToAdd: ItemList
        var color: UIColor  = .blue

        var body: some View {
            Button(action:
                { self.searchIsActive = true },
                   label:
                {
                    ZStack {
                        Color(color)
                            .clipShape(Circle())
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                    }
                    .frame(width: 50, height: 50)
                    .padding()
            })
                .sheet(isPresented: $searchIsActive) {
                    SearchView(isPresented: self.$searchIsActive)
                        .environment(\.managedObjectContext, self.recordContext)
            }
        }
    }

}



struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
        Home(newItem: "")
    }
}

