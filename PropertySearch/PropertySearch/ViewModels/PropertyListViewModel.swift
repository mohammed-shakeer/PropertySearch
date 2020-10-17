//
//  PropertyListViewModel.swift
//  PropertySearch
//
//  Created by Mohammed Shakeer on 17/10/2020.
//  Copyright © 2020 PF. All rights reserved.
//

import UIKit

class PropertyListViewModel: NSObject {

    var tableView: UITableView?
    var propertyViewModels: [PropertyViewModel]!
    var sortOption: SortOption?
    var isDataLoading: Bool = false
    var currentPage: Int = 1
    var totalCount: Int = Constant.placeHolderCount
    var currentCount: Int {
      return propertyViewModels.count
    }

    override init() {
        super.init()
        propertyViewModels = [PropertyViewModel]()
    }

    convenience init(tableView: UITableView?) {
        self.init()
        self.tableView = tableView
    }

    /**
     requests for properties from server and saves.
     - Parameter completion: returns error in case of error in response
     */
    func list(completion: ((Error?) -> Void)? = nil) {

        guard !isDataLoading else { return }
        isDataLoading = true

        request { [weak self] (data, error) in
            
            self?.isDataLoading = false
            // handle errors
            if let error = error {
                DispatchQueue.main.async {
                    UIAlertController.ok(message: error.localizedDescription)
                }
                completion?(error)
                return
            }
            
            // get response
            guard let responseData = data else { completion?(nil); return }

            do {
                let listResponse = try JSONDecoder().decode(PropertyList.self, from: responseData)
                self?.totalCount = listResponse.total
                self?.currentPage += 1
                let viewModels = listResponse.list.compactMap { PropertyViewModel($0) }
                self?.propertyViewModels += viewModels
                DispatchQueue.main.async {
                    self?.tableView?.reloadData()
                }
                completion?(nil)
            }
            catch {
                completion?(nil)
            }
        }
    }

    func performSortAction(option: SortOption?) {

        sortOption = option
        propertyViewModels = []
        totalCount = Constant.placeHolderCount
        currentPage = 1
        tableView?.reloadData()
        tableView?.scrollToRow(at: IndexPath(row: 0, section: 0),
                                    at: .top,
                                    animated: false)
        list()
    }

    private func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row >= currentCount
    }
}

extension PropertyListViewModel: UITableViewDataSource {
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = PropertyTableViewCell.identifier
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? PropertyTableViewCell else {
            return UITableViewCell()
        }
        let viewModel = propertyViewModels.indices.contains(indexPath.row) ? propertyViewModels[indexPath.row] : nil
        cell.viewModel = viewModel
        return cell
    }
}

extension PropertyListViewModel: UITableViewDataSourcePrefetching {

  func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
    if indexPaths.contains(where: isLoadingCell) {
        list()
    }
  }
}

// Requestable has all information related to the service calls initiated by this viewModel
extension PropertyListViewModel: Requestable {
    
    var path: APIPath? {
        return .search
    }
    
    var params: [String : Any] {

        var param = ["page": "\(currentPage)"]
        if let value = sortOption?.rawValue {
            param["ob"] = value
        }
        return param
    }
}
