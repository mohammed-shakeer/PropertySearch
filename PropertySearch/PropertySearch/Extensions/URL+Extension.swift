//
//  URLExtensions.swift
//  PropertySearch
//
//  Created by Mohammed Shakeer on 17/10/2020.
//  Copyright © 2020 PF. All rights reserved.
//

import UIKit

extension URL {
    // Adds parameters to the url
    func appendParameters( params: [String: Any]) -> URL? {
        var components = URLComponents(string: self.absoluteString)
        components?.queryItems = params.map { element in URLQueryItem(name: element.key, value: element.value as? String) }
        return components?.url
    }

}

