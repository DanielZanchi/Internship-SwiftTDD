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

    func testFuelNotNil() {
        XCTAssertNotNil(myFuel)
    }
    
    func testIDNotNil() {
        XCTAssertNotNil(myFuel.id)
    }
    
    func testIDType() {
        XCTAssert(myFuel.id as Any is Int64)
    }
    
    func testIDValue() {
        XCTAssertEqual(myFuel.id, 1234)
    }
    
    func testDateNotNil() {
        XCTAssertNotNil(myFuel.date)
    }
    
    func testDateType() {
        XCTAssert(myFuel.date as Any is Date)
    }
    
    func testDateValue() {
        XCTAssertEqual(myFuel.date, Date(timeIntervalSince1970: 0))
    }
    
    func testMileageNotNil() {
        XCTAssertNotNil(myFuel.mileage)
    }
    
    func testMileageType() {
        XCTAssert(myFuel.mileage as Any is Int)
    }
    
    func testMileageValue() {
        XCTAssertEqual(myFuel.mileage, 3450)
    }
    
    func testQuantityNotNil() {
        XCTAssertNotNil(myFuel.quantity)
    }
    
    func testQuantityType() {
        XCTAssert(myFuel.quantity as Any is Double)
    }
    
    func testQuantityValue() {
        XCTAssertEqual(myFuel.quantity, 100)
    }
    
    func testPricePerUnitNotNil() {
        XCTAssertNotNil(myFuel.pricePerUnit)
    }
    
    func testPricePerUnitType() {
        XCTAssert(myFuel.pricePerUnit as Any is Double)
    }
    
    func testPricePerUnitValue() {
        XCTAssertEqual(myFuel.pricePerUnit, 2)
    }
    
    func testIsTankNotFuelNotNil() {
        XCTAssertNotNil(myFuel.isTankNotFull)
    }
    
    func testIsTankNotFuelType() {
        XCTAssert(myFuel.isTankNotFull as Any is Bool)
    }
    
    func testIsTankNotFuelValue() {
        XCTAssertEqual(myFuel.isTankNotFull, false)
    }
    
    func testDistanceNotNl() {
        XCTAssertNotNil(myFuel.calculateDistange(fromFuel: myFuel))
    }
    
    func testDistanceType() {
        XCTAssert(myFuel.calculateDistange(fromFuel: myFuel) as Any is Int)
    }
    
    func testDistanceValue() {
        let fuel1 = Fuel(id: 1, date: Date(), mileage: 0, quantity: 50, pricePerUnit: 1.5, isTankNotFull: false)
        let fuel2 = Fuel(id: 2, date: Date(), mileage: 100, quantity: 50, pricePerUnit: 1.5, isTankNotFull: false)
        XCTAssertEqual(fuel2.calculateDistange(fromFuel: fuel1), 100)
    }
    
    func testConsumptionNotNil() {
        XCTAssertNotNil(myFuel.calculateConsumption(afterDistance: 0))
    }
    
    func testConsumptionType() {
        XCTAssert(myFuel.calculateConsumption(afterDistance: 0) as Any is Double)
    }
    
    func testConsumption() {
        let distance = 100
        XCTAssertEqual(myFuel.calculateConsumption(afterDistance: distance), 1.0)
    }
    
}
