//
//  DatabaseManagerTests.swift
//  FuelTrackerTests
//
//  Created by Daniel Zanchi on 17/12/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import XCTest
@testable import FuelTracker

class DatabaseManagerTests: XCTestCase {
            
    var database: DatabaseManager!
    
    override func setUp() {
        super.setUp()
        
        database = DatabaseManager.instance
        _ = database.dropTable()
        database.createTable()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAddFuel() {
        XCTAssertEqual(addFuel(), 1)
    }
    
    func testAddFuelFail() {
        XCTAssertEqual(database.dropTable(), true)
        XCTAssertEqual(addFuel(), -1)
    }
    
    func testGetFuels() {        
        // add two fuels
        XCTAssertEqual(addFuel(), 1)
        XCTAssertEqual(addFuel(), 2)
        
        //read two fuels
        XCTAssertEqual(database.getFuels()![0].pricePerUnit, 1.5)
        XCTAssertEqual(database.getFuels()![1].pricePerUnit, 1.5)
    }
    
    func testGetFuelsFail() {
        // add two fuels
        XCTAssertEqual(addFuel(), 1)
        XCTAssertEqual(addFuel(), 2)
        
        XCTAssertEqual(database.dropTable(), true)
        
        //read two fuels
        XCTAssertEqual(database.getFuels(), nil)
    }
    
    func testDeleteFuel() {
        XCTAssertEqual(addFuel(), 1)
        XCTAssertEqual(database.deleteFuel(fID: 1), true)
    }
    
    func testDeleteFuelFail() {
        XCTAssertEqual(addFuel(), 1)
        XCTAssertEqual(database.dropTable(), true)
        XCTAssertEqual(database.deleteFuel(fID: 10), false)
    }
    
    func testUpdateFuel() {
        XCTAssertEqual(addFuel(), 1)
        let newFuel = Fuel(id: 1, date: Date(), mileage: 200, quantity: 100, pricePerUnit: 3.0)
        XCTAssertEqual(database.updateFuel(fID: 1, newFuel: newFuel), true)
        XCTAssertEqual(database.getFuels()![0].pricePerUnit, 3.0)
    }
    
    func testUpdateFuelFail() {
        XCTAssertEqual(addFuel(), 1)
        let newFuel = Fuel(id: 3, date: Date(), mileage: 200, quantity: 100, pricePerUnit: 3.0)
        XCTAssertEqual(database.updateFuel(fID: 3, newFuel: newFuel), false)
    }
    
    func testUpdateFuelFail2() {
        XCTAssertEqual(addFuel(), 1)
        
        XCTAssertEqual(database.dropTable(), true)
        
        let newFuel = Fuel(id: 1, date: Date(), mileage: 200, quantity: 100, pricePerUnit: 3.0)
        XCTAssertEqual(database.updateFuel(fID: 1, newFuel: newFuel), false)
    }
    
    func testDropTableFail() {
        database = DatabaseManager.instance
        XCTAssertEqual(database.destroyDatabase(), true)
        XCTAssertEqual(database.dropTable(), false)
    }
    
    func testDestroyTableFail() {
        XCTAssertEqual(database.destroyDatabase(), true)
        XCTAssertEqual(database.destroyDatabase(), false)
    }
    
    //Helper
    private func addFuel() -> Int64 {
        return database.addFuel(dateOfFuel: Date(), mileageOnSave: 100, quantityOfFuel: 50, pricePerUnitOfFuel: 1.5)
    }
    
}
