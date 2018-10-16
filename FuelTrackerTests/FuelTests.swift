//
//  FuelTests.swift
//  FuelTrackerTests
//
//  Created by Daniel Zanchi on 16/10/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import XCTest
@testable import FuelTracker

class FuelTests: XCTestCase {

    var fuel: Fuel!
    
    override func setUp() {
        
    }

    override func tearDown() {
        fuel = nil
    }
    
    func testFuel() {
        fuel = Fuel()
        XCTAssertNotNil(fuel)
    }

    func testQuantity() {
        fuel = Fuel()
        fuel.setQuantity(quantity: 10)
        XCTAssertEqual(10, fuel.getQuantity())
    }

}
