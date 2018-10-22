//
//  Double+toString.swift
//  FuelTracker
//
//  Created by Daniel Zanchi on 20/10/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import Foundation

extension Double {
    // return string value froma a double with two decimals 
    var stringValue: String {
        return (String(format: "%.2f", self))
    }
    
}
