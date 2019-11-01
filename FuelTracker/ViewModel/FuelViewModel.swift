//
//  FuelViewModel.swift
//  FuelTracker
//
//  Created by Daniel Zanchi on 17/10/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import Foundation

class FuelViewModel {
    var quantity: String!
    var pricePerUnit: String!
    var price: String!
    var date: String!
    var distance: String!
    var consumption: String!
    
    init(fuel: Fuel, distance: Int, consumption: Double) {
        self.quantity = fuel.quantity.toString(decimals: 2)
        self.pricePerUnit = fuel.pricePerUnit.toString(decimals: 3)
        self.price = (fuel.pricePerUnit * fuel.quantity).toString(decimals: 2)
        self.date = fuel.date.toString(dateFormat: "dd/MM/YYYY")
        self.distance = "\(distance)"
        self.consumption = consumption.toString(decimals: 2)
    }
    
}
