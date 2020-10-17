//
//  SortViewControllerTests.swift
//  PropertySearchTests
//
//  Created by Mohammed Shakeer on 17/10/20.
//  Copyright © 2020 PF. All rights reserved.
//

import XCTest
@testable import PropertySearch

class SortViewControllerTests: XCTestCase {

    var systemUnderTest: SortViewController!

    override func setUpWithError() throws {
        systemUnderTest = UIStoryboard.main?.instantiateViewController(withClass: SortViewController.self)
        systemUnderTest.loadViewIfNeeded()
    }

    func testSUT_SortOptionCount() {
        let sortCount = systemUnderTest.viewModel.sortOptions.count
        XCTAssertEqual(4, sortCount, "Failed to initialize correct sort options")
    }

    func testSUT_HasTableView() {
        XCTAssertNotNil(systemUnderTest.tableView, "Failed to find tableview")
    }

    func testSUT_HasDoneButton() {
        let done = systemUnderTest.navigationItem.rightBarButtonItem
        XCTAssertNotNil(done, "Failed to find done button")
    }

    func testSUT_SelectedSortOption() {
        let firstIndex = IndexPath(row: 0, section: 0)
        guard let tableView = systemUnderTest.tableView else { return }
        systemUnderTest.viewModel.tableView(tableView, didSelectRowAt: firstIndex)
        let selectedSortOption = systemUnderTest.viewModel.selectedSortOption
        let expectedSortOption = SortOption.priceDescending
        XCTAssertEqual(selectedSortOption, expectedSortOption, "Failed to select right sort option")
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
