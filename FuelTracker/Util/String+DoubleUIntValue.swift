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
        return Double(self) ?? 0
    }
    
    var UIntValue: UInt {
        return UInt(self) ?? 0
    }
}

