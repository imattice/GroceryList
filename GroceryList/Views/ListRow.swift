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
		///Checkmark
			item.isChecked ?
				Image(systemName: "checkmark") :
				Image(systemName: "square")

		///Quantity
			VStack {
				Text(String(item.quantity.count))
					.font(.title)
				if item.quantity.measurement != "individual" && item.quantity.measurement != "individuals" {
				Text(String(item.quantity.measurement))
					.font(.caption)
					.italic()
					.minimumScaleFactor(0.7)
					.lineLimit(1)
				}
			}
			.frame(width: 40, height: nil, alignment: .center)

		///Label
            Text(item.quantity.count < 1 ?
                item.label.capitalized /*.plural()*/ : item.label.capitalized)
				.font(.title)
				.minimumScaleFactor(0.5)
				.lineLimit(2)
				.allowsTightening(true)
			Spacer()

		}
		.padding(.horizontal)
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
			.previewLayout(.fixed(width: 300, height: 75))

    }
}
