//
//  UITextField+enabledColor.swift
//  FuelTracker
//
//  Created by Daniel Zanchi on 23/10/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    // Will change the background color when a UITextField is disabled
    override open var isEnabled: Bool {
        willSet {
            backgroundColor = newValue ? UIColor.white : UIColor(red: 201/255, green: 193/255, blue: 195/255, alpha: 1.0)
        }
    }
}
