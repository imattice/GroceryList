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
//    @FetchRequest(entity: Item.entity(), sortDescriptors: []) var list: FetchedResults<Item>
    
    var list: [Item] = Item.all()
    @State var groupedList: [String : [Item]] = { Item.groupedList() }()
    @State var sectionHeaders: [String] = { Item.aisles().sorted(by: <) }()
    
//    @FetchedResults(entity: Item.entity(), sortDescriptors: []) var sectionHeaders
    
//    var sectionHeaders: [String] = ["Produce", "Dairy", "Bread", "Other"]

	@State var newItem: String              = "+ New Item"
    @State var searchIsActive: Bool         = false
    
    
//    var sectionHeaders: [String] = { Item.aislesForList(in: recordContext) }()
    
//    func sectionHeaders() -> [String] {
//        return Item.aisles() //in: recordContext)
//    }
//    func groupedList() -> [String: [Item]] -> {
//        
//    }
    
    var body: some View {
		NavigationView {
            ZStack {
			VStack {
                ///Results List
				List {
                    ForEach(sectionHeaders, id: \.self) { title in
                        //ensure there are items before creating a section
//                        guard let items = groupedList[title] else { continue }

                        Section(header: Text(title)) {
                            ForEach(self.groupedList[title]!) { item in
                                ListRow(item: item)
                            }
                        }
                        
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

