//
//  UIAlertController+Extension.swift
//  PropertySearch
//
//  Created by Mohammed Shakeer on 17/10/2020.
//  Copyright © 2020 PF. All rights reserved.
//

import UIKit

import UIKit

extension UIAlertController {
    // shows alert with ok button
    static func ok(title: String = "", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        let keyWindow = UIApplication.shared.windows.first { $0.isKeyWindow }
        keyWindow?.rootViewController?.present(alert, animated: true)
    }
}
