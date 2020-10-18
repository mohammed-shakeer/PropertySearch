//
//  UIView+Extension.swift
//  PropertySearch
//
//  Created by Mohammed Shakeer on 17/10/2020.
//  Copyright © 2020 PF. All rights reserved.
//

import UIKit

public extension UIView {
    
    /// To get the UINib
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    /// gets all subviews recursively in a view
    func getAllSubviews() -> [UIView] {
        var allSubviews = [UIView]()
        for subview in subviews {
            allSubviews.append(subview)
            allSubviews += subview.getAllSubviews()
        }
        return allSubviews
    }

    /// Removes all subviews in a view
    func removeAllSubviews() {
        subviews.forEach({ $0.removeFromSuperview() })
    }
}
