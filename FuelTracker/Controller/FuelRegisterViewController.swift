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
    
    //MARK: Outlets
    @IBOutlet weak var fuelTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let fuels =  DatabaseManager.instance.getFuels() {
            self.fuels = fuels
        }
    }  
    
    override func viewWillAppear(_ animated: Bool) {
        fuelTableView.reloadData()
    }
    
    @IBAction func unwindToFuelRegister(sender: UIStoryboardSegue) {
    }

}

extension FuelRegisterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let fuels = DatabaseManager.instance.getFuels()?.count {
            return fuels
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {        
        let cell = tableView.dequeueReusableCell(withIdentifier: FuelTableViewCell.identifier) as! FuelTableViewCell

        if let fuel = DatabaseManager.instance.getFuels()?[indexPath.row] {
            var distance = 0
            var consumption = 0.00
            
            if (indexPath.row + 1) < DatabaseManager.instance.getFuels()!.count {
                let oldFuel = DatabaseManager.instance.getFuels()![indexPath.row + 1]
                distance = fuel.mileage - oldFuel.mileage
                consumption = Double(distance) / fuel.quantity
            }
            
            let fuelView = FuelViewModel(fuel: fuel)
            
            
            
            cell.setup(model: fuelView, distance: distance, consumption: consumption)
        }
        
        return cell
    }
    
    
}
