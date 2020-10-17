//
//  PropertyTests.swift
//  PropertySearchTests
//
//  Created by Mohammed Shakeer on 17/10/20.
//  Copyright © 2020 PF. All rights reserved.
//

import XCTest
@testable import PropertySearch

class PropertyTests: XCTestCase {

    var systemUnderTest: Property!
    
    let image = "https://www.propertyfinder.ae/property/8c698fc6044b9e4813ef3a0d88313e80/260/185/MODE/4a224f/7744220-dd790o.jpg?ctr=ae"
    let price = "1,400,000"
    let currency = "AED"
    let bedrooms = "3"
    let bathrooms = "4"

    
    override func setUpWithError() throws {
        guard let path = Bundle.main.path(forResource: "Properties", ofType: "json") else { return }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let listResponse = try JSONDecoder().decode(PropertyList.self, from: data)
            systemUnderTest = listResponse.list.first
        } catch {
            DebugPrint("Error opening json file")
        }
        
    }

    func testSUT_InitializesImage() {
        XCTAssertEqual(systemUnderTest?.image, image, "image is not initialized")
    }

    func testSUT_InitializesPrice() {
        XCTAssertEqual(systemUnderTest?.price, price, "price is not initialized")
    }

    func testSUT_InitializesCurrency() {
        XCTAssertEqual(systemUnderTest?.currency, currency, "currency is not initialized")
    }

    func testSUT_InitializesBedrooms() {
        XCTAssertEqual(systemUnderTest?.bedrooms, bedrooms, "bedrooms is not initialized")
    }

    func testSUT_InitializesBathrooms() {
        XCTAssertEqual(systemUnderTest?.bathrooms, bathrooms, "bathrooms is not initialized")
    }

    override func tearDownWithError() throws {
        systemUnderTest = nil
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
