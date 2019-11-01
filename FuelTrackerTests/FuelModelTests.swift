//
//  FuelTests.swift
//  FuelTrackerTests
//
//  Created by Daniel Zanchi on 16/10/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import XCTest
@testable import FuelTracker

class FuelModelTests: XCTestCase {

    var myFuel: Fuel!
    var myFuelViewModel: FuelViewModel!
    
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
        myFuelViewModel = FuelViewModel(fuel: myFuel, distance: 500, consumption: 18)
        
    }

    override func tearDown() {
        super.tearDown()
        myFuelViewModel = nil
        myFuel = nil
    }
    
    func testFuelViewModel() {
        XCTAssertNotNil(myFuelViewModel)
    }
    
    func testQuantityNotNil() {
        XCTAssertNotNil(myFuelViewModel.quantity)
    }
    
    func testQuantityType() {
        XCTAssert(myFuelViewModel.quantity as Any is String)
    }
    
    func testQuantityValue() {
        XCTAssertEqual("100.00", myFuelViewModel.quantity)
    }
    
    func testPricePerUnitNotNil() {
        XCTAssertNotNil(myFuelViewModel.pricePerUnit)
    }
    
    func testPricePerUnitType() {
        XCTAssert(myFuelViewModel.pricePerUnit as Any is String)
    }
    
    func testPricePerUnitValue() {
        XCTAssertEqual("2.000", myFuelViewModel.pricePerUnit)
    }
    
    func testPriceNotNil() {
        XCTAssertNotNil(myFuelViewModel.price)
    }
    
    func testPriceType() {
        XCTAssert(myFuelViewModel.price as Any is String)
    }
    
    func testPriceValue() {
        XCTAssertEqual("200.00", myFuelViewModel.price)
    }
    
    func testDateNotNil() {
        XCTAssertNotNil(myFuelViewModel.date)
    }
    
    func testDateType() {
        XCTAssert(myFuelViewModel.date as Any is String)
    }
    
    func testDateValue() {
        XCTAssertEqual("01/01/1970", myFuelViewModel.date)
    }

    func testDistanceNotNil() {
        XCTAssertNotNil(myFuelViewModel.distance)
    }

    func testDistanceType() {
        XCTAssert(myFuelViewModel.distance as Any is String)
    }

    func testDistanceValue() {
        XCTAssertEqual(myFuelViewModel.distance, "500")
    }

    func testConsumptionNotNil() {
        XCTAssertNotNil(myFuelViewModel.consumption)
    }
    
    func testConsumptionType() {
        XCTAssert(myFuelViewModel.consumption as Any is String)
    }
    
    func testConsumptionValue() {
        XCTAssertEqual(myFuelViewModel.consumption, "18.00")
    }
    
}
