//
//  View+Print.swift
//  GroceryList
//
//  Created by Ike Mattice on 9/16/20.
//  Copyright © 2020 Ike Mattice. All rights reserved.
//

import SwiftUI

extension View {
     func Print(_ vars: Any...) -> some View {
         for v in vars { print(v) }
         return EmptyView()
     }
}
