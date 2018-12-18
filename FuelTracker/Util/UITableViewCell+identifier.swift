//
//  UITableViewCell+identifier.swift
//  FuelTracker
//
//  Created by Daniel Zanchi on 18/12/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import UIKit

extension UITableViewCell {
    class var identifier: String {
        return String(describing: self)
    }
}
