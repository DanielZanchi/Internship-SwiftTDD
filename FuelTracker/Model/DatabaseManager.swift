//
//  DatabaseManager.swift
//  FuelTracker
//
//  Created by Daniel Zanchi on 11/12/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import SQLite

class DatabaseManager: DatabaseManagerProtocol {
    
    static let instance = DatabaseManager()
    
    private let database: Connection?
    
    let fuelsTable = Table("fuels")
    
    let id = Expression<Int64>("id")
    let date = Expression<Date>("date")
    let mileage = Expression<Int>("mileage")
    let quantity = Expression<Double>("quantity")
    let pricePerUnit = Expression<Double>("pricePerUnit")
    
    required init() {
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileURL = documentDirectory.appendingPathComponent("fuels").appendingPathExtension("sqlite3")
            database = try Connection(fileURL.path)
            
        } catch {
            database = nil
            print("unable to create database connection")
            print(error)
        }
        
        _ = createTable()
    }
    
    func createTable() -> Bool {
        let create = self.fuelsTable.create { (table) in
            table.column(id, primaryKey: true)
            table.column(date)
            table.column(mileage)
            table.column(quantity)
            table.column(pricePerUnit)
        }
        
        do {
            try database?.run(create)
            return true
        } catch {
            print("unable to create table")
            print(error)
            return false
        }
    }
    
    func addFuel(dateOfFuel: Date, mileageOnSave: Int, quantityOfFuel: Double, pricePerUnitOfFuel: Double) -> Int64 {
        let insertFuel = fuelsTable.insert(date <- dateOfFuel, mileage <- mileageOnSave, quantity <- quantityOfFuel, pricePerUnit <- pricePerUnitOfFuel)
        do {
            let id = try database!.run(insertFuel)
            return id
        } catch {
            print(error)
            return -1
        }
    }
    
    func getFuels() -> [Fuel]? {
        var fuels = [Fuel]()
        
        do {
            if let fuelsList = try database?.prepare(fuelsTable) {
                for fuel in fuelsList {
                    fuels.append(Fuel(id: fuel[id], date: fuel[date], mileage: fuel[mileage], quantity: fuel[quantity], pricePerUnit: fuel[pricePerUnit]))
                }
            } else {
                print("error")
            }
        } catch {
            print("error while reading fuels")
            print(error)
            return nil
        }
        
        return fuels
    }
    
    func deleteFuel(fID: Int64) -> Bool {
        do {
            let fuel = fuelsTable.filter(id == fID)
            try database?.run(fuel.delete())
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    func updateFuel(fID: Int64, newFuel: Fuel) -> Bool {
        let fuel = fuelsTable.filter(id == fID)
        do {
            let update = fuel.update([
                date <- newFuel.date, 
                mileage <- newFuel.mileage, 
                quantity <- newFuel.quantity, 
                pricePerUnit <- newFuel.pricePerUnit
                ])
            
            if try database!.run(update) > 0 {
                return true
            }
        } catch {
            print(error)
        }
        
        return false
    }
    
    func dropTable() -> Bool {
        do {
            try database?.run(fuelsTable.drop())
            return true
        } catch {
            print(error)
            print("wasn't able to drop table")
            return false
        }
    }

}
