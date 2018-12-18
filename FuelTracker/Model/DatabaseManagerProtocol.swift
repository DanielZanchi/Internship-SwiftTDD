//
//  DatabaseManagerProtocol.swift
//  FuelTracker
//
//  Created by Daniel Zanchi on 17/12/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import Foundation
import SQLite

//sourcery: AutoMockable
protocol DatabaseManagerProtocol {
    
    init(manager: FileManager)
    
    func addFuel(dateOfFuel: Date, mileageOnSave: Int, quantityOfFuel: Double, pricePerUnitOfFuel: Double) -> Int64
    
    func getFuels() -> [Fuel]?
    
    func deleteFuel(fID: Int64) -> Bool
    
    func updateFuel(fID: Int64, newFuel: Fuel) -> Bool
    
}
