//
//  APIPath.swift
//  PropertySearch
//
//  Created by Mohammed Shakeer on 17/10/2020.
//  Copyright © 2020 PF. All rights reserved.
//

import UIKit

enum APIPath: String {
    case search = "mobileapi/search"

    var name: String {
        return rawValue
    }
}
