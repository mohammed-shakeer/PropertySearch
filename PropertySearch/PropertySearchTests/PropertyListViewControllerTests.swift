//
//  PropertyListViewControllerTests.swift
//  PropertySearchTests
//
//  Created by Mohammed Shakeer on 17/10/20.
//  Copyright © 2020 PF. All rights reserved.
//

import XCTest
@testable import PropertySearch

class PropertyListViewControllerTests: XCTestCase {

    var systemUnderTest: PropertyListViewController!

    override func setUpWithError() throws {
        systemUnderTest = UIStoryboard.main?.instantiateViewController(withClass: PropertyListViewController.self)
        guard let path = Bundle.main.path(forResource: "Properties", ofType: "json") else { return }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let listResponse = try JSONDecoder().decode(PropertyList.self, from: data)
            let viewModel = PropertyListViewModel()
            let viewModels = listResponse.list.compactMap { PropertyViewModel($0) }
            viewModel.propertyViewModels = viewModels
            systemUnderTest.viewModel = viewModel

        } catch {
            DebugPrint("Error opening json file")
        }
        
        systemUnderTest.loadViewIfNeeded()
    }

    func testSUT_HasTableView() {
        XCTAssertNotNil(systemUnderTest.tableView, "Failed to find tableview")
    }

    func testSUT_HasSortButton() {
        let sort = systemUnderTest.navigationItem.rightBarButtonItem
        XCTAssertNotNil(sort, "Failed to find sort button")
    }

    func testSUT_TotalCells() {
        let cellCount = systemUnderTest.tableView?.numberOfRows(inSection: 0)
        let dataCount = systemUnderTest.viewModel.propertyViewModels.count
        XCTAssertNotEqual(cellCount, dataCount, "Failed to add more cells than data")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
