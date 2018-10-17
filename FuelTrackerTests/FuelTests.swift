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
        myFuel = Fuel(id: 0, quantity: 100, pricePerUnit: 1, date: Date(timeIntervalSince1970: 0)) //should return date as 01/01/1970
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
        XCTAssertEqual("01/01/1970", myFuelViewModel.name)
    }
    
}
