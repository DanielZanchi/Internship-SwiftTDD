//
//  ViewController.swift
//  FuelTracker
//
//  Created by Daniel Zanchi on 16/10/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import UIKit
import SQLite

class FuelRegisterViewController: UIViewController {
    
    var fuels = [Fuel]()
    
    var fuelsManager: FuelsManager!
    
    // MARK: Outlets
    @IBOutlet weak var fuelTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fuelsManager = FuelsManager(database: Database().myDatabase)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let fuels = fuelsManager.getFuels() {
            self.fuels = fuels
        }

        fuelTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    @IBAction func unwindToFuelRegister(sender: UIStoryboardSegue) {
    }
    
    @IBAction func clearAllTapped(_ sender: UIBarButtonItem) {
        fuelsManager.deleteAllFuels()  
        
        if let fuels = fuelsManager.getFuels() {
            self.fuels = fuels
        }      
        
        fuelTableView.reloadData()
    }
}
