//
//  Double+toString.swift
//  FuelTracker
//
//  Created by Daniel Zanchi on 20/10/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import Foundation

extension Double {
    
    // return string value from a double with decimals
    func toString(decimals: UInt) -> String {
        return String(format: "%.\(decimals)f", self)
    }
    
}
