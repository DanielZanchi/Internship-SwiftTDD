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

    var myFuel: Fuel!
    var myFuelViewModel: FuelViewModel!
    
    override func setUp() {
        super.setUp()
        myFuel = Fuel(id: 1234, date: Date(timeIntervalSince1970: 0), mileage: 3450, quantity: 100, pricePerUnit: 2) // should return date as 01/01/1970
        myFuelViewModel = FuelViewModel(fuel: myFuel)
        
    }

    override func tearDown() {
        super.tearDown()
        myFuelViewModel = nil
        myFuel = nil
    }
    
    func testFuel() {
        XCTAssertNotNil(myFuel)
    }
    
    func testFuelViewModel() {
        XCTAssertNotNil(myFuelViewModel)
    }
    
    func testName() {
        XCTAssertEqual("01/01/1970", myFuelViewModel.date)
    }
    
    func testQuantity() {
        XCTAssertEqual("100.00", myFuelViewModel.quantity)
    }
    
    func testMileage() {
        XCTAssertEqual(3450, myFuelViewModel.mileage)
    }

    func testPricePerUnit() {
        XCTAssertEqual("2.000", myFuelViewModel.pricePerUnit)
    }

    func testPrice() {
        XCTAssertEqual("200.00", myFuelViewModel.price)
    }
    
}
