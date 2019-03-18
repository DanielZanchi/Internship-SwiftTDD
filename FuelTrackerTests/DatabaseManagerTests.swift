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
    }
    
    func testAddFuel() {
        XCTAssertEqual(addFuel(), 1)
    }
    
    func testDropTableFail() {
        fuelsManager.dropTable()
    }
    
    func testAddFuelFail() {
        fuelsManager.dropTable()
        XCTAssertEqual(addFuel(), -1)
    }
    
    func testGetFuels() {        
        // add two fuels
        addFuel()
        addFuel()
        
        //read two fuels
        XCTAssertEqual(fuelsManager.getFuels()?[1].pricePerUnit, 1.5)
    }
    
    func testGetFuelsFail() {
        // add two fuels
        addFuel()
        addFuel()
        
        fuelsManager.dropTable()
        
        //read two fuels
        XCTAssertEqual(fuelsManager.getFuels(), nil)
    }
    
    func testDeleteFuel() {
        addFuel()
        XCTAssertEqual(fuelsManager.deleteFuel(fID: 1), true)
    }
    
    func testDeleteFuelFail() {
        addFuel()
        fuelsManager.dropTable()
        XCTAssertEqual(fuelsManager.deleteFuel(fID: 10), false)
    }
    
    func testUpdateFuel() {
        addFuel()
        let newFuel = Fuel(id: 1, date: Date(), mileage: 200, quantity: 100, pricePerUnit: 3.0)
        XCTAssertEqual(fuelsManager.updateFuel(fID: 1, newFuel: newFuel), true)
    }
    
    func testUpdateFuelFail() {
        addFuel()
        addFuel()
        let newFuel = Fuel(id: 3, date: Date(), mileage: 200, quantity: 100, pricePerUnit: 3.0)
        XCTAssertEqual(fuelsManager.updateFuel(fID: 3, newFuel: newFuel), false)
    }
    
    func testUpdateFuelFail2() {
        addFuel()
        fuelsManager.dropTable()
        
        let newFuel = Fuel(id: 1, date: Date(), mileage: 200, quantity: 100, pricePerUnit: 3.0)
        XCTAssertEqual(fuelsManager.updateFuel(fID: 1, newFuel: newFuel), false)
    }
    
    
    func testCreateTableFail() {
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileURL = documentDirectory.appendingPathComponent("fuels").appendingPathExtension("sqlite3")
            let t = ""
            try t.write(to: fileURL, atomically: false, encoding: String.Encoding.utf8)
        } catch {
            fuelsManager = nil
            print("unable to create database connection")
            print(error)
        }
        print("DATABASE \(fuelsManager.createTable())")
        XCTAssertEqual(fuelsManager.createTable(), false)
    }
    
    //Helper
    @discardableResult private func addFuel() -> Int64 {
        return fuelsManager.addFuel(dateOfFuel: Date(), mileageOnSave: 100, quantityOfFuel: 50, pricePerUnitOfFuel: 1.5)
    }
    
}
