//
//  Constant.swift
//  PropertySearch
//
//  Created by Mohammed Shakeer on 17/10/2020.
//  Copyright © 2020 PF. All rights reserved.
//

import UIKit

func DebugPrint(_ items: Any...) {
    #if DEBUG
    Swift.print(items)
    #endif
}

struct Constant {
    static let placeHolderCount = 10
}

extension Constant {
    struct URL {
        static let base = "https://www.propertyfinder.ae/"
    }
}

extension Constant {
    struct StatusCode {
        static let valid = 200
    }
}
