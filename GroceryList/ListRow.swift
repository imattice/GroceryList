//
//  ListRowView.swift
//  GroceryList
//
//  Created by Ike Mattice on 10/24/19.
//  Copyright © 2019 Ike Mattice. All rights reserved.
//

import SwiftUI

struct ListRow: View {
	let item: Item

	var body: some View {
		HStack {
			item.isChecked ?
				Image(systemName: "checkmark") :
				Image(systemName: "square")
			VStack {
				Text(String(item.quantity.count))
					.font(.title)
				Text(String(item.quantity.measurement))
					.font(.caption)
					.italic()
			}
			.frame(width: 60, height: nil, alignment: .center)

			VStack(alignment: .leading) {
				Text(item.name.capitalized)
					.font(.headline)
//				if let variety = item.variety {
				Text(item.variety!.lowercased())
						.font(.subheadline)
						.italic()
//				}
			}
//			.padding(.horizontal)

			Spacer()

		}
		.padding(.horizontal)
//		.padding(.leading, 0)
	}
}



struct ListRowPreview: PreviewProvider {
    static var previews: some View {
		let bread = sampleList[0]
		let apple = sampleList[1]
		let beans = sampleList[2]
		let detergent = sampleList[13]

		return Group {
				ListRow(item: bread)
				ListRow(item: apple)
				ListRow(item: beans)
				ListRow(item: detergent)
			}
			.previewLayout(.fixed(width: 300, height: 50))

    }
}
