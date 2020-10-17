//
//  ServiceManagerTests.swift
//  PropertySearchTests
//
//  Created by Mohammed Shakeer on 17/10/20.
//  Copyright © 2020 PF. All rights reserved.
//

import XCTest
@testable import PropertySearch

class MockViewModel: Requestable {
    
    var path: APIPath? {
        return .invalid
    }
}

class ServiceManagerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testSuccessfullListingService() {
        
        let promise = expectation(description: "List service invoked")
        
        let viewModel = PropertyListViewModel()
        ServiceManager.shared.fetchData(from: viewModel) { (result, error) in
        
            XCTAssertNotNil(result, "Failed to retrieve list")
            promise.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

    func testFailureListingService() {
        
        // check with wrong url if API returns error
        let promise = expectation(description: "List service invoked")
        let viewModel = MockViewModel()
        ServiceManager.shared.fetchData(from: viewModel) { (result, error) in

            XCTAssertNotNil(error, "Failed to return error")
            promise.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
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

