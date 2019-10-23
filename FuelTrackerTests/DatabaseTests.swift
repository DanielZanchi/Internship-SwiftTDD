//
//  DatabaseTests.swift
//  FuelTrackerTests
//
//  Created by Daniel Zanchi on 22/03/2019.
//  Copyright © 2019 Daniel Zanchi. All rights reserved.
//

import XCTest
import SQLite
@testable import FuelTracker

class DatabaseTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDatabaseNotNil() {
        let myDatabase = Database().myDatabase
        XCTAssertNotNil(myDatabase)
    }
    
    func testDatabaseType() {
        let myDatabase = Database().myDatabase
        XCTAssert((myDatabase as Any) is Connection)
    }
    
}
