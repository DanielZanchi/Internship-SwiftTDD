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
        database.dropTable()
        database.createTable()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAddFuel() {
        XCTAssertEqual(addFuel(), 1)
    }
    
    func testDropTable() {
        XCTAssertEqual(database.dropTable(), true)
    }
    
    func testDropTableFail() {
        database.dropTable()
    }
    
    func testAddFuelFail() {
        database.dropTable()
        XCTAssertEqual(addFuel(), -1)
    }
    
    func testGetFuels() {        
        // add two fuels
        addFuel()
        addFuel()
        
        //read two fuels
        XCTAssertEqual(database.getFuels()?[1].pricePerUnit, 1.5)
    }
    
    func testGetFuelsFail() {
        // add two fuels
        addFuel()
        addFuel()
        
        database.dropTable()
        
        //read two fuels
        XCTAssertEqual(database.getFuels(), nil)
    }
    
    func testDeleteFuel() {
        addFuel()
        XCTAssertEqual(database.deleteFuel(fID: 1), true)
    }
    
    func testDeleteFuelFail() {
        addFuel()
        testDropTable()
        XCTAssertEqual(database.deleteFuel(fID: 10), false)
    }
    
    func testUpdateFuel() {
        addFuel()
        let newFuel = Fuel(id: 1, date: Date(), mileage: 200, quantity: 100, pricePerUnit: 3.0)
        XCTAssertEqual(database.updateFuel(fID: 1, newFuel: newFuel), true)
    }
    
    func testUpdateFuelFail() {
        addFuel()
        addFuel()
        let newFuel = Fuel(id: 3, date: Date(), mileage: 200, quantity: 100, pricePerUnit: 3.0)
        XCTAssertEqual(database.updateFuel(fID: 3, newFuel: newFuel), false)
    }
    
    func testUpdateFuelFail2() {
        addFuel()
        database.dropTable()
        
        let newFuel = Fuel(id: 1, date: Date(), mileage: 200, quantity: 100, pricePerUnit: 3.0)
        XCTAssertEqual(database.updateFuel(fID: 1, newFuel: newFuel), false)
    }
    
    
    func testCreateTableFail() {
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileURL = documentDirectory.appendingPathComponent("fuels").appendingPathExtension("sqlite3")
            let t = ""
            try t.write(to: fileURL, atomically: false, encoding: String.Encoding.utf8)
        } catch {
            database = nil
            print("unable to create database connection")
            print(error)
        }
        
        XCTAssertEqual(database.createTable(), false)
    }
    
    //Helper
    @discardableResult private func addFuel() -> Int64 {
        return database.addFuel(dateOfFuel: Date(), mileageOnSave: 100, quantityOfFuel: 50, pricePerUnitOfFuel: 1.5)
    }
    
}
