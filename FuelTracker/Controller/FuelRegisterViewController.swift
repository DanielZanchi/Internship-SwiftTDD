//
//  ViewController.swift
//  FuelTracker
//
//  Created by Daniel Zanchi on 16/10/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import UIKit

class FuelRegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func unwindToFuelRegister(sender: UIStoryboardSegue) {
        print("action unwindo")
        if let sourceViewController = sender.source as? AddFuelViewController, let fuel = sourceViewController.fuel {
            print("save fuel")
        }
    }
    
}
