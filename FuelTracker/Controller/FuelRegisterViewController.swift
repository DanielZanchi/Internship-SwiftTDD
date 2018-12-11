//
//  ViewController.swift
//  FuelTracker
//
//  Created by Daniel Zanchi on 16/10/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import UIKit
import SQLite

class FuelRegisterViewController: UIViewController {
    
    var database: Connection!
    
    let fuelsTable = Table("fuels")
    let id = Expression<Int>("id")
    let date = Expression<Date>("date")
    let mileage = Expression<Int>("mileage")
    let quantity = Expression<Double>("quantity")
    let pricePerUnit = Expression<Double>("pricePerUnit")
    
    var fuelToSave: Fuel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDatabase()
    }
    
    private func setupDatabase() {
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileURL = documentDirectory.appendingPathComponent("fuels").appendingPathExtension("sqlite3")
            let database = try Connection(fileURL.path)
            self.database = database
            createTable()
        } catch {
            print(error)
        }
        
    }
    
    private func createTable() {
        let create = self.fuelsTable.create { (table) in
            table.column(id, primaryKey: true)
            table.column(date)
            table.column(mileage)
            table.column(quantity)
            table.column(pricePerUnit)
        }
        
        do {
            try database?.run(create)
        } catch {
            print(error)
        }
    }
    
    private func saveToDatabase() {
        if let dateOfFuel = fuelToSave?.date, let mileageToSave = fuelToSave?.mileage, let quantityToSave = fuelToSave?.quantity, let priceToSave = fuelToSave?.pricePerUnit {
            let insertFuel = fuelsTable.insert(date <- dateOfFuel, mileage <- mileageToSave, quantity <- quantityToSave, pricePerUnit <- priceToSave)
            
            do {
                try database?.run(insertFuel)
                listFuels()
            } catch {
                print(error)
            } 
        } else {
            print("there was a problem while retriving data from fuelToSave")
        }
    }
    
    private func listFuels() {
        do {
            let fuels = try database?.prepare(fuelsTable)
            for fuel in fuels! {
                print("id: \(fuel[self.id]), date: \(fuel[self.date]), mileage: \(fuel[self.mileage]), quantity: \(fuel[self.quantity]), pricePerUnit: \(fuel[self.pricePerUnit])")
            }
        } catch {
            print(error)
        }
    }
    
    @IBAction func unwindToFuelRegister(sender: UIStoryboardSegue) {
        print("action unwindo")
        if let sourceViewController = sender.source as? AddFuelViewController, let fuel = sourceViewController.fuel {
            fuelToSave = fuel
            
            saveToDatabase()
        }
    }
    
    
    
}
