//
//  ServiceManager.swift
//  PropertySearch
//
//  Created by Mohammed Shakeer on 17/10/2020.
//  Copyright © 2020 PF. All rights reserved.
//

import UIKit

class ServiceManager {
    
    // singleton
    static let shared = ServiceManager()
    
    var session: URLSession
    
    private init() {
        session = URLSession.shared
    }
    
    var baseURL: URL {
        guard let url =  URL(string: Constant.URL.base) else {
            fatalError("Couldn't build base url")
        }
        return url
    }
    
    /**
     fetches data from server.
     
     - Parameter request: contains instance conforming to Requestable protocol consists of all details related to request
     - Parameter completion: returns json or error based on response
     */
    func fetchData(from request: Requestable, completion: ((Data?, Error?) -> Void)?) {
        
        DebugPrint(request.url)
        // data task
        session.dataTask(with: request.url) { (data, response, error) in
            
            // abort if we have errors or if we dont have data
            guard error == nil, let data = data else {
                completion?(nil, error)
                return
            }

            // Return Error if response status code is not 200
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
            let err = NSError(domain: "Invalid", code: statusCode, userInfo: nil)
            guard statusCode == Constant.StatusCode.valid else {
                completion?(nil, err)
                return
            }
            
            completion?(data, error)
            }.resume()
    }
    
    /**
     Downloads image data from server.
     
     - Parameter url: url to fetch image from
     - Parameter completion: returns UIImage if exists, else nil.
     */
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, error == nil else { return }
            completion(UIImage(data: data))
            }.resume()
    }
}
