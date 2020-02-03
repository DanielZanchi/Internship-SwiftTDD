//
//  String+toDouble.swift
//  FuelTracker
//
//  Created by Daniel Zanchi on 20/10/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import Foundation

extension String {
    
    var doubleValue: Double {
        let stringWithPoint = self.replaceCommaWithPoint
        return Double(stringWithPoint) ?? 0
    }
    
    var intValue: Int {
        return Int(self) ?? 0
    }
    
    var replaceCommaWithPoint: String {
        return String(self.map { $0 == "," ? "." : $0 })
    }
    
}
