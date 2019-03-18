//
//  Database.swift
//  FuelTracker
//
//  Created by Daniel Zanchi on 18/03/2019.
//  Copyright © 2019 Daniel Zanchi. All rights reserved.
//

import SQLite

class Database {
    
    var myDatabase: Connection
    
    init() {
        let documentDirectory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = documentDirectory?.appendingPathComponent("fuels").appendingPathExtension("sqlite3")
        let connection = try! Connection((fileURL?.path)!)
        myDatabase = connection
    }
}
