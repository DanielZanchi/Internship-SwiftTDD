//
//  FuelManager.swift
//  FuelTracker
//
//  Created by Daniel Zanchi on 18/03/2019.
//  Copyright © 2019 Daniel Zanchi. All rights reserved.
//

import SQLite
import SwiftyBeaver

class FuelsManager: FuelsManagerProtocol {
    
    private var database: Connection?
    private let fuelsTable = Table("fuels")
    
    let id = Expression<Int64>("id")
    let date = Expression<Date>("date")
    let mileage = Expression<Int>("mileage")
    let quantity = Expression<Double>("quantity")
    let pricePerUnit = Expression<Double>("pricePerUnit")
    let isTankNotFull = Expression<Bool>("isTankNotFull")
    
    init(database: Connection) {
        self.database = database
        createTable()
    }
    
    @discardableResult func createTable() -> Bool {
        let create = self.fuelsTable.create { (table) in
            table.column(id, primaryKey: true)
            table.column(date)
            table.column(mileage)
            table.column(quantity)
            table.column(pricePerUnit)
            table.column(isTankNotFull)
        }
        do {
            try database?.run(create)
            SwiftyBeaver.info("Table successfully created")
            return true
        } catch {
            SwiftyBeaver.info("Unable to create table")
            SwiftyBeaver.warning(error)
            return false
        }
    }
    
    @discardableResult func addFuel(dateOfFuel: Date, mileage mileageOnSave: Int, quantity quantityOfFuel: Double, pricePerUnit pricePerUnitOfFuel: Double, isTankNotFull isTankNotFullFuel: Bool) -> Int64 {
        let insertFuel = fuelsTable.insert(
            date <- dateOfFuel,
            mileage <- mileageOnSave,
            quantity <- quantityOfFuel,
            pricePerUnit <- pricePerUnitOfFuel,
            isTankNotFull <- isTankNotFullFuel
        )
        
        do {
            let id = try database!.run(insertFuel)
            SwiftyBeaver.info("Fuel successfully created with ID: \(id)")
            return id
        } catch {
            SwiftyBeaver.warning("Unable to add Fuel")
            SwiftyBeaver.error(error)
            return -1
        }
    }
    
    func getFuels() -> [Fuel]? {
        var fuels = [Fuel]()
        
        do {
            if let fuelsList = try database?.prepare(fuelsTable.order(date.desc)) {
                for fuel in fuelsList {
                    fuels.append(Fuel(
                        id: fuel[id],
                        date: fuel[date],
                        mileage: fuel[mileage],
                        quantity: fuel[quantity],
                        pricePerUnit: fuel[pricePerUnit],
                        isTankNotFull: fuel[isTankNotFull]
                    ))
                }
            } else {
                SwiftyBeaver.warning("Unable to read fuels")
            }
            SwiftyBeaver.info("There are \(fuels.count) fuels")
            return fuels
        } catch {
            SwiftyBeaver.warning("Unable to read fuels")
            SwiftyBeaver.error(error)
            return nil
        }
    }
    
    func deleteFuel(withID fID: Int64) -> Bool {
        do {
            let fuel = fuelsTable.filter(id == fID)
            try database?.run(fuel.delete())
            return true
        } catch {
            SwiftyBeaver.warning("Unable to delete fuel with ID: \(fID)")
            SwiftyBeaver.error(error)
            return false
        }
    }
    
    @discardableResult func deleteAllFuels() -> Bool {
        do {
            try database?.run(fuelsTable.delete())
            SwiftyBeaver.info("All fuels deleted")
            return true
        } catch {
            SwiftyBeaver.warning("Unable to delete fuels")
            SwiftyBeaver.error(error)
            return false
        }
    }
    
    func updateFuel(withID fID: Int64, toFuel newFuel: Fuel) -> Bool {
        let fuel = fuelsTable.where(id == fID)
        do {
            let update = fuel.update([
                date <- newFuel.date, 
                mileage <- newFuel.mileage, 
                quantity <- newFuel.quantity, 
                pricePerUnit <- newFuel.pricePerUnit
                ])
            let result = try database!.run(update)
            if result > 0 {
                SwiftyBeaver.info("The fuel got updated!")
                return true
            } else {
                return false
            }
        } catch {
            SwiftyBeaver.warning("Unable to update fuel with ID: \(fID)")
            SwiftyBeaver.error(error)            
            return false
        }
    }
    
    func dropTable() {
        _ = try? database?.run(fuelsTable.drop())
    }
    
}
