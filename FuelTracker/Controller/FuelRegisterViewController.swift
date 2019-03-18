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
    
    private var fuels = [Fuel]()
    
    let fuelsManager = FuelsManager(database: Database().myDatabase )
    
    //MARK: Outlets
    @IBOutlet weak var fuelTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let fuels = fuelsManager.getFuels() {
            self.fuels = fuels
        }
    }  
    
    override func viewWillAppear(_ animated: Bool) {
        fuelTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    @IBAction func unwindToFuelRegister(sender: UIStoryboardSegue) {
    }
    
}

extension FuelRegisterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows = 0
        if let fuels = fuelsManager.getFuels() {
            rows = fuels.count
        }
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {        
        let cell = tableView.dequeueReusableCell(withIdentifier: FuelTableViewCell.identifier) as! FuelTableViewCell
        
        if let fuel = fuelsManager.getFuels()?[indexPath.row] {
            var distance = 0
            var consumption = 0.00
            
            if (indexPath.row + 1) < (fuelsManager.getFuels()?.count)! {
                if let oldFuel = fuelsManager.getFuels()?[indexPath.row + 1] {
                    distance = FuelsHelper.calculateDistance(from: fuel, to: oldFuel)
                    consumption = FuelsHelper.calculateConsumption(distance: distance, fuelQuantity: fuel.quantity)
                }
            }
            
            let fuelView = FuelViewModel(fuel: fuel)
            
            
            
            cell.setup(model: fuelView, distance: distance, consumption: consumption)
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { 
        if let EditViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AddFuelVC") as? AddFuelViewController {
            
            if let fuelToEdit = fuelsManager.getFuels()?[indexPath.row] {
                EditViewController.fuelToEdit = fuelToEdit
                EditViewController.isEditingFuel = true
                
                self.navigationController?.pushViewController(EditViewController, animated: true)
            }
        }
        
    }
    
    
}
