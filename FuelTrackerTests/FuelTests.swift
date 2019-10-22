//
//  FuelTests.swift
//  FuelTrackerTests
//
//  Created by Daniel Zanchi on 22/10/2019.
//  Copyright © 2019 Daniel Zanchi. All rights reserved.
//

import XCTest
@testable import FuelTracker

class FuelTests: XCTestCase {

    var myFuel: Fuel!
    
    override func setUp() {
         super.setUp()
               myFuel = Fuel(
                   id: 1234,
                   date: Date(timeIntervalSince1970: 0),
                   mileage: 3450,
                   quantity: 100,
                   pricePerUnit: 2,
                   isTankNotFull: false
               ) // should return date as 01/01/1970
    }

    override func tearDown() {
        super.tearDown()
        myFuel = nil
    }

    func testFuel() {
        XCTAssertNotNil(myFuel)
    }
    
    func testID() {
        XCTAssertEqual(myFuel.id, 1234)
    }
    
    func testDistance() {
        let fuel1 = Fuel(id: 1, date: Date(), mileage: 0, quantity: 50, pricePerUnit: 1.5, isTankNotFull: false)
        let fuel2 = Fuel(id: 2, date: Date(), mileage: 100, quantity: 50, pricePerUnit: 1.5, isTankNotFull: false)
        XCTAssertEqual(fuel2.calculateDistange(fromFuel: fuel1), 100)
    }
    
    func testConsumption() {
        let distance = 100
        XCTAssertEqual(myFuel.calculateConsumption(afterDistance: distance), 1.0)
    }
    
}
