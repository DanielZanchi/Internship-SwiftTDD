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
    var mileage: Int!
    var pricePerUnit: String!
    var price: String!
    var date: String!
    
    init(fuel: Fuel) {
        self.quantity = fuel.quantity.toString(decimals: 2)
        self.mileage = fuel.mileage
        self.pricePerUnit = fuel.pricePerUnit.toString(decimals: 3)
        self.price = (fuel.pricePerUnit * fuel.quantity).toString(decimals: 2)
        self.date = fuel.date.toString(dateFormat: "dd/MM/YYYY")
    }
    
}
