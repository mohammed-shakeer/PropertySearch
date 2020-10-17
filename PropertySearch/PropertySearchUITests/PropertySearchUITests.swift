//
//  PropertySearchUITests.swift
//  PropertySearchUITests
//
//  Created by Mohammed Shakeer on 17/10/2020.
//  Copyright © 2020 PF. All rights reserved.
//

import XCTest

class PropertySearchUITests: XCTestCase {

    override func setUpWithError() throws {
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    func testPropertySort() {
        let app = XCUIApplication()
        app.launch()
        app.buttons["acid_propertyList_sort"].tap()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Price Descending"].tap()
        app.buttons["acid_sort_done"].tap()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
