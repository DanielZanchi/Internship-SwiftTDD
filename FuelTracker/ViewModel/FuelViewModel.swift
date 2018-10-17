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
    
    init(fuel: Fuel) {
        self.name = getDate(date: fuel.date)
        self.quantity = String(format: "%.2f", fuel.quantity)
    }
    
    private func getDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YYYY"
        return formatter.string(from: date)
    }
}
