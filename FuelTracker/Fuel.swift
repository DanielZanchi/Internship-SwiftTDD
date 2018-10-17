//
//  Fuel.swift
//  FuelTracker
//
//  Created by Daniel Zanchi on 16/10/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import Foundation

class Fuel {
    private var quantity: Double!
    
    init() {
        self.quantity = 0
    }
    
    init(quantity: Double) {
        self.quantity = quantity
    }
    
    func setQuantity(quantity: Double) {
        self.quantity = quantity
    }
    
    func getQuantity() -> Double {
        return self.quantity
    }
    
}
