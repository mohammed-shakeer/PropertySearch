//
//  PropertyListViewController.swift
//  PropertySearch
//
//  Created by Mohammed Shakeer on 17/10/2020.
//  Copyright © 2020 PF. All rights reserved.
//

import UIKit

class PropertyListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView?
    var viewModel: PropertyListViewModel!

    // Constants
    let cellHeight: CGFloat = 50.0

    override func viewDidLoad() {
        super.viewDidLoad()

        configureScreen()
        viewModel.list()
    }
    
    // MARK: Configuration methods
    private func configureScreen() {
        
        title = "Property Search"
        viewModel = PropertyListViewModel(tableView: tableView)
        let sortButton = UIBarButtonItem(image: UIImage(systemName: "arrow.up.arrow.down"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(actionSort))
        sortButton.accessibilityIdentifier = "acid_propertyList_sort"
        navigationItem.rightBarButtonItem = sortButton
        navigationController?.navigationBar.tintColor = .label
        configureTableview()
    }

    private func configureTableview() {
        
        tableView?.register(PropertyTableViewCell.nib, forCellReuseIdentifier: PropertyTableViewCell.identifier)
        tableView?.estimatedRowHeight = cellHeight
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.dataSource = viewModel
        tableView?.prefetchDataSource = viewModel
    }

    @objc
    private func actionSort() {
        guard let viewController = UIStoryboard.main?.instantiateViewController(withClass: SortViewController.self) else {
            return
        }
        viewController.viewModel.selectedSortOption = viewModel.sortOption
        viewController.sortOptionSelected = { [weak self] option in
            DispatchQueue.main.async {
                self?.viewModel.performSortAction(option: option)
            }
        }
        navigationController?.pushViewController(viewController, animated: true)
    }

}
