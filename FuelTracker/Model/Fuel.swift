//
//  Fuel.swift
//  FuelTracker
//
//  Created by Daniel Zanchi on 16/10/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import Foundation

struct Fuel: Equatable {
    let id: Int64!
    let date: Date!
    let mileage: Int!
    let quantity: Double!
    let pricePerUnit: Double!
}
