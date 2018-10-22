//
//  FuelViewModel.swift
//  FuelTracker
//
//  Created by Daniel Zanchi on 17/10/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import Foundation

class FuelViewModel {
    var name: String!
    var quantity: String!
    var mileage: UInt!
    var pricePerUnit: String!
    var price: String!
    
    init(fuel: Fuel) {
        self.name = getDate(date: fuel.date)
        self.quantity = fuel.quantity.stringValue
        self.mileage = fuel.mileage
        self.pricePerUnit = fuel.pricePerUnit.stringValue
        self.price = (fuel.pricePerUnit * fuel.quantity).stringValue
    }
    
    private func getDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YYYY"
        return formatter.string(from: date)
    }
    
}
