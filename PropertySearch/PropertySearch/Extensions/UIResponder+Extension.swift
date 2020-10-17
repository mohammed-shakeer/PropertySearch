//
//  UIResponder+Extension.swift
//  PropertySearch
//
//  Created by Mohammed Shakeer on 17/10/2020.
//  Copyright © 2020 PF. All rights reserved.
//

import UIKit

extension UIResponder {
    //To get the identifer name same as View name
    public static var identifier: String {
        return String(describing: self)
    }
}
