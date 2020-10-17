//
//  SortViewController.swift
//  PropertySearch
//
//  Created by Mohammed Shakeer on 17/10/2020.
//  Copyright © 2020 PF. All rights reserved.
//

import UIKit

class SortViewController: UIViewController {

    // Constants
    let cellHeight: CGFloat = 50.0

    @IBOutlet weak var tableView: UITableView?
    var viewModel: SortViewModel = SortViewModel()
    var sortOptionSelected: ((SortOption?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureScreen()
    }

    // MARK: Configuration methods
    private func configureScreen() {
        
        title = "Sort"
        configureTableview()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(actionDone))
    }

    private func configureTableview() {
        
        tableView?.register(SortTableViewCell.nib, forCellReuseIdentifier: SortTableViewCell.identifier)
        tableView?.estimatedRowHeight = cellHeight
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.dataSource = viewModel
        tableView?.delegate = viewModel
    }

    @objc
    private func actionDone() {
        navigationController?.popViewController(animated: true)
        sortOptionSelected?(viewModel.selectedSortOption)
    }
}
