//
//  Requestable.swift
//  PropertySearch
//
//  Created by Mohammed Shakeer on 17/10/2020.
//  Copyright © 2020 PF. All rights reserved.
//

import UIKit

protocol Requestable {
    
    // the base url
    var baseURL: URL { get }
    
    // the full url with path details attached which will be used to hit service
    var url: URL { get }
    
    // path component
    var path: APIPath? { get }
    
    // query params
    var params: [String: Any] { get }
    
    // request method
    func request(completion: ((Data?, Error?) -> Void)?)
}

extension Requestable {
    
    // defaults to base url of service manager
    var baseURL: URL {
        return ServiceManager.shared.baseURL
    }
    
    var url: URL {
        guard let path = path,
            let qualifiedUrl = baseURL.appendingPathComponent(path.name).appendParameters(params: params) else { return baseURL }
        return qualifiedUrl
    }
    
    // defaults to nil
    var path: APIPath? {
        return nil
    }
    
    var params: [String: Any] {
        return [:]
    }
    
    func request(completion: ((Data?, Error?) -> Void)?) {
        ServiceManager.shared.fetchData(from: self, completion: completion)
    }
}
