//
//  FuelsHelperTests.swift
//  FuelTrackerTests
//
//  Created by Daniel Zanchi on 19/12/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import Foundation

import XCTest
@testable import FuelTracker

class FuelsHelperTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDistance() {
        let fuel1 = Fuel(id: 1, date: Date(), mileage: 0, quantity: 50, pricePerUnit: 1.5)
        let fuel2 = Fuel(id: 2, date: Date(), mileage: 100, quantity: 50, pricePerUnit: 1.5)
        XCTAssertEqual(FuelsHelper.calculateDistance(from: fuel2, to: fuel1), 100)
    }
    
    func testConsumption() {
        let distance = 100
        let fuelQuantity: Double = 10
        XCTAssertEqual(FuelsHelper.calculateConsumption(distance: distance, fuelQuantity: fuelQuantity), 10.0)
    }
}
