//
//  PropertyTableViewCell.swift
//  PropertySearch
//
//  Created by Mohammed Shakeer on 17/10/2020.
//  Copyright © 2020 PF. All rights reserved.
//

import UIKit

class PropertyTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewProperty: UIImageView?
    @IBOutlet weak var labelPrice: UILabel?
    @IBOutlet weak var labelBedrooms: UILabel?
    @IBOutlet weak var labelBathrooms: UILabel?

    var viewModel: PropertyViewModel? {
        didSet {
            if viewModel == nil {
                showSkeleton()
            } else {
                hideSkeleton()
                populateData()
            }
        }
    }
    
    private func populateData() {
        labelPrice?.text = viewModel?.price
        labelBedrooms?.text = viewModel?.bedrooms
        labelBathrooms?.text = viewModel?.bathrooms
        imageViewProperty?.imageFromURL(url: viewModel?.thumbnailUrl)
    }
    
}

extension PropertyTableViewCell: Skeletonable {
    
    var skeletonFields: [UIView?] {
        [labelPrice, labelBathrooms, labelBedrooms, imageViewProperty]
    }
    
}
