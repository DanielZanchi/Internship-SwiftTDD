//
//  FuelsHelper.swift
//  FuelTracker
//
//  Created by Daniel Zanchi on 19/12/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import Foundation

class FuelsHelper {
    
    /// Return: distance of mileage FROM Fuel -> TO Fuel
    static func calculateDistance(from: Fuel, to: Fuel) -> Int {
        return from.mileage - to.mileage
    }
    
    /// Return: consumption  based on Distance and Quantity of last fuel
    static func calculateConsumption(distance: Int, fuelQuantity: Double) -> Double {
        return Double(distance) / fuelQuantity
    }
}
