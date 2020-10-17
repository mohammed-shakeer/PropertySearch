//
//  UIImageView+Extension.swift
//  PropertySearch
//
//  Created by Mohammed Shakeer on 17/10/2020.
//  Copyright © 2020 PF. All rights reserved.
//

import UIKit

extension UIImageView {
    
    // downloads image from the passed url and displays it in imageView
    public func imageFromURL(url: URL?) {
        
        guard let url = url else { return }

        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.frame = CGRect.init(x: 0,
                                              y: 0,
                                              width: frame.size.width,
                                              height: frame.size.height)
        activityIndicator.startAnimating()
        if image == nil {
            addSubview(activityIndicator)
        }
        
        ServiceManager.shared.downloadImage(from: url) { [weak self] (image) in
            DispatchQueue.main.async { [weak self] in
                activityIndicator.removeFromSuperview()
                self?.image = image
            }
        }
    }
    
}
