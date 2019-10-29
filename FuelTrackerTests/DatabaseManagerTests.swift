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
    
    var fuelsManager: FuelsManager!
    
    override func setUp() {
        super.setUp()
        
        let database = Database().myDatabase
        fuelsManager = FuelsManager(database: database)
        fuelsManager.dropTable()
        fuelsManager.createTable()
    }
    
    override func tearDown() {
        super.tearDown()
        fuelsManager = nil
    }
    
    func testAddFuelReturnType() {
        XCTAssert(addFuel() as Any is Int64)
    }
    
    func testAddFuelReturnId() {
        XCTAssertEqual(addFuel(), 1)
    }
    
    func testAddFuelFail() {
        fuelsManager.dropTable()
        XCTAssertEqual(addFuel(), -1)
    }
    
    func testGetFuels() {        
        // add two fuels
        addFuel()
        addFuel()
        
        // read two fuels
        XCTAssertEqual(fuelsManager.getFuels()?[1].pricePerUnit, 1.5)
    }
    
    func testGetFuelsFail() {
        // add two fuels
        addFuel()
        addFuel()
        
        fuelsManager.dropTable()
        
        // read two fuels
        XCTAssertEqual(fuelsManager.getFuels(), nil)
    }
    
    func testDropTable() {
        fuelsManager.dropTable()
    }
    
    func testDeleteFuel() {
        addFuel()
        XCTAssertEqual(fuelsManager.deleteFuel(withID: 1), true)
    }
    
    func testDeleteFuelFail() {
        addFuel()
        fuelsManager.dropTable()
        XCTAssertEqual(fuelsManager.deleteFuel(withID: 10), false)
    }
    
    func testUpdateFuel() {
        addFuel()
        let newFuel = Fuel(id: 1, date: Date(), mileage: 200, quantity: 100, pricePerUnit: 3.0, isTankNotFull: false)
        XCTAssertEqual(fuelsManager.updateFuel(withID: 1, toFuel: newFuel), true)
    }
    
    func testUpdateFuelFail() {
        addFuel()
        addFuel()
        let newFuel = Fuel(id: 3, date: Date(), mileage: 200, quantity: 100, pricePerUnit: 3.0, isTankNotFull: false)
        XCTAssertEqual(fuelsManager.updateFuel(withID: 300, toFuel: newFuel), false)
    }
    
    func testUpdateFuelFail2() {
        addFuel()
        fuelsManager.dropTable()
        
        let newFuel = Fuel(id: 1, date: Date(), mileage: 200, quantity: 100, pricePerUnit: 3.0, isTankNotFull: false)
        XCTAssertEqual(fuelsManager.updateFuel(withID: 1, toFuel: newFuel), false)
    }
    
    func testDeleteAll() {
        addFuel()
        
        XCTAssert(fuelsManager.deleteAllFuels())
        XCTAssertEqual(0, fuelsManager.getFuels()?.count)
    }
    
    func testDeleteAllFail() {
        addFuel()
        fuelsManager.dropTable()
        XCTAssertFalse(fuelsManager.deleteAllFuels())
    }
    
    func testCreateTableFail() {
        let documentDirectory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        if let dir = documentDirectory {
            let fileURL = dir.appendingPathComponent("fuels").appendingPathExtension("sqlite3")
            let t = ""
            try? t.write(to: fileURL, atomically: false, encoding: String.Encoding.utf8)
        }
        
        XCTAssertEqual(fuelsManager.createTable(), false)
    }
    
    // Helper
    @discardableResult private func addFuel() -> Int64 {
        return fuelsManager.addFuel(dateOfFuel: Date(), mileage: 100, quantity: 50, pricePerUnit: 1.5, isTankNotFull: false)
    }
    
}
