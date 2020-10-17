//
//  SortTableViewCell.swift
//  PropertySearch
//
//  Created by Mohammed Shakeer on 17/10/2020.
//  Copyright © 2020 PF. All rights reserved.
//

import UIKit

class SortTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel?
    let selectedColor: UIColor = .label
    
    override func awakeFromNib() {
        super.awakeFromNib()
        labelTitle?.layer.borderWidth = 1.0
        labelTitle?.layer.borderColor = selectedColor.cgColor
    }

    func populate(option: SortOption, selected: Bool) {

        DebugPrint(selected, option.title)
        labelTitle?.backgroundColor = selected ? selectedColor : .clear
        labelTitle?.textColor = selected ? .white : selectedColor
        labelTitle?.text = option.title
    }
}
