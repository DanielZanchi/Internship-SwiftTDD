//
//  FuelRegisterTableView.swift
//  FuelTracker
//
//  Created by Daniel Zanchi on 20/03/2019.
//  Copyright © 2019 Daniel Zanchi. All rights reserved.
//

import UIKit

extension FuelRegisterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows = 0
        if let fuels = fuelsManager.getFuels() {
            rows = fuels.count
        }
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FuelTableViewCell.identifier) as? FuelTableViewCell else { return UITableViewCell() }
        
        if let fuel = fuelsManager.getFuels()?[indexPath.row] {
            var distance: Int = 0
            var consumption: Double = 0.00
            
            if let fuelsCount = fuelsManager.getFuels()?.count, fuel.isTankNotFull == false {
                if (indexPath.row + 1) < fuelsCount {
                    if let oldFuel = fuelsManager.getFuels()?[indexPath.row + 1] {
                        distance = fuel.calculateDistange(fromFuel: oldFuel)
                        consumption = fuel.calculateConsumption(afterDistance: distance)
                    }
                }
            } 
            
            let fuelView = FuelViewModel(fuel: fuel, distance: distance, consumption: consumption)
            cell.setup(model: fuelView)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { 
        if let EditViewController = UIStoryboard.init(
            name: "Main",
            bundle: Bundle.main
            ).instantiateViewController(withIdentifier: "AddFuelVC") as? AddFuelViewController {
            
            if let fuelToEdit = fuelsManager.getFuels()?[indexPath.row] {
                EditViewController.fuelToEdit = fuelToEdit
                EditViewController.isEditingFuel = true
                
                self.navigationController?.pushViewController(EditViewController, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let fuelToDelete = fuelsManager.getFuels()?[indexPath.row] {
                if fuelsManager.deleteFuel(fID: fuelToDelete.id) {
                    tableView.deleteRows(at: [indexPath], with: .automatic)
                    tableView.reloadData()
                }
            }
        }
    }
    
}
