//
//  SortOption.swift
//  PropertySearch
//
//  Created by Mohammed Shakeer on 17/10/2020.
//  Copyright © 2020 PF. All rights reserved.
//

import UIKit

enum SortOption: String {
    case priceAscending = "pa"
    case priceDescending = "pd"
    case bedsAscending = "ba"
    case bedsDescending = "bd"

    var title: String {
        switch self {
        case .priceAscending:
            return "Price Ascending"
        case .priceDescending:
            return "Price Descending"
        case .bedsAscending:
            return "Beds Ascending"
        case .bedsDescending:
            return "Beds Descending"
        }
    }
    
}

