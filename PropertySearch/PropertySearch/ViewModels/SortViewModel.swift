//
//  SortViewModel.swift
//  PropertySearch
//
//  Created by Mohammed Shakeer on 17/10/2020.
//  Copyright © 2020 PF. All rights reserved.
//

import UIKit

class SortViewModel: NSObject {

    let sortOptions: [SortOption]
    var selectedSortOption: SortOption?
    
    override init() {
        sortOptions = [.priceDescending,
                       .priceAscending,
                       .bedsDescending,
                       .bedsAscending]
        super.init()
    }
}

extension SortViewModel: UITableViewDataSource {

    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = SortTableViewCell.identifier
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? SortTableViewCell else {
            return UITableViewCell()
        }
        let option = sortOptions[indexPath.row]
        let isSelected = option == selectedSortOption
        cell.populate(option: option, selected: isSelected)
        return cell
    }
}

extension SortViewModel: UITableViewDelegate {
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let option = sortOptions[indexPath.row]
        selectedSortOption = option == selectedSortOption ? nil : option
        tableView.reloadData()
    }
}
