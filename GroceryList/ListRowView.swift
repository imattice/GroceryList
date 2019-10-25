//
//  ListRowView.swift
//  GroceryList
//
//  Created by Ike Mattice on 10/24/19.
//  Copyright © 2019 Ike Mattice. All rights reserved.
//

import SwiftUI

struct ListRowView: View {
	let item: Item

	var body: some View {
		HStack {
			item.isChecked ?
				Image(systemName: "checkmark") :
				Image(systemName: "square")
			VStack {
				Text(item.name)
			}
			.padding(.horizontal)
			Spacer()
			Image(systemName: "chevron.right")
		}
		.padding(.horizontal)
		.padding(.leading, 0)
	}
}



struct ListRowViewPreview: PreviewProvider {
    static var previews: some View {
		ListRowView(item: Item(name: "Apple"))
    }
}
