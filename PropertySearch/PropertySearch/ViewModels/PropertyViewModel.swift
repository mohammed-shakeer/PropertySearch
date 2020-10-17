//
//  PropertyViewModel.swift
//  PropertySearch
//
//  Created by Mohammed Shakeer on 17/10/2020.
//  Copyright © 2020 PF. All rights reserved.
//

import UIKit

class PropertyViewModel {

    var property: Property!

    required init(_ property: Property) {
        self.property = property
    }
    
    var price: String {
        return "\(property.currency ?? "") \(property.price ?? "")"
    }

    var bedrooms: String {
        return "\(property.bedrooms ?? "0") bedrooms"
    }
    
    var bathrooms: String {
        return "\(property.bathrooms ?? "0") bathrooms"
    }

    var thumbnailUrl: URL? {
        return URL(string: property.image ?? "")
    }

}
