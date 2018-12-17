//
//  ViewController.swift
//  FuelTracker
//
//  Created by Daniel Zanchi on 16/10/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import UIKit

class FuelRegisterViewController: UIViewController {
    
    private var fuels = [Fuel]()
    
    var fuelToSave: Fuel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let fuels =  DatabaseManager.instance.getFuels() {
            self.fuels = fuels
        }
    }   
    
}
