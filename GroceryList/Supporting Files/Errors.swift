//
//  Errors.swift
//  GroceryList
//
//  Created by Ike Mattice on 8/14/20.
//  Copyright © 2020 Ike Mattice. All rights reserved.
//

import Foundation

//MARK: - JSON Parsing Errors
enum ParsingError: Error {
    case fileNotFound(filepath: URL)
}
