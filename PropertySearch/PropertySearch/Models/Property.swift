//
//  Property.swift
//  PropertySearch
//
//  Created by Mohammed Shakeer on 17/10/2020.
//  Copyright © 2020 PF. All rights reserved.
//

import UIKit

struct Property: Codable {

    var image: String?
    var price: String?
    var currency: String?
    var bedrooms: String?
    var bathrooms: String?

    enum CodingKeys: String, CodingKey {
        case image = "thumbnail"
        case price
        case currency
        case bedrooms
        case bathrooms
    }
}

struct PropertyList: Codable {
    let list: [Property]
    let total: Int

    enum CodingKeys: String, CodingKey {
        case list = "res"
        case total
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        list = try values.decodeIfPresent([Property].self, forKey: .list) ?? []
        total = try values.decodeIfPresent(Int.self, forKey: .total) ?? 0
    }
}
