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
        rows = self.fuels.count
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {        
        let cell = tableView.dequeueReusableCell(withIdentifier: FuelTableViewCell.identifier) as! FuelTableViewCell
        
        let fuel = self.fuels[indexPath.row]
        var distance: Int = 0
        var consumption: Double = 0.00
        
        if fuel.isTankNotFull == false && fuels.count > (indexPath.row + 1) {
            let oldFuel = self.fuels[indexPath.row + 1]
            distance = fuel.calculateDistange(fromFuel: oldFuel)
            consumption = fuel.calculateConsumption(afterDistance: distance)
        } 
        
        let fuelView = FuelViewModel(fuel: fuel, distance: distance, consumption: consumption)
        cell.setup(model: fuelView)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { 
        if let editViewController = UIStoryboard.init(
            name: "Main",
            bundle: Bundle.main
            ).instantiateViewController(withIdentifier: "AddFuelVC") as? AddFuelViewController {
            
            let fuelToEdit = self.fuels[indexPath.row] 
            editViewController.fuelToEdit = fuelToEdit
            editViewController.isEditingFuel = true
            
            self.navigationController?.pushViewController(editViewController, animated: true)
            
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let fuelToDelete = self.fuels[indexPath.row] 
            if fuelsManager.deleteFuel(withID: fuelToDelete.id) {
                if let fuels = fuelsManager.getFuels() {
                    self.fuels = fuels
                }
                tableView.deleteRows(at: [indexPath], with: .automatic)
                tableView.reloadData()
            }
        }
    }
    
}
