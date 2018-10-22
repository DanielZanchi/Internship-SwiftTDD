//
//  AddFuelViewController.swift
//  FuelTracker
//
//  Created by Daniel Zanchi on 16/10/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import UIKit

class AddFuelViewController: UIViewController {

    @IBOutlet weak var mileageTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var totalAmountTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(AddFuelViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func totalAmountTextFieldChanged(_ sender: UITextField) {
        let totalAmount: Double = sender.text?.doubleValue ?? 0
        let quantity: Double = (quantityTextField.text)?.doubleValue ?? 0
        let pricePerUnit =  totalAmount / quantity
        priceTextField.text = pricePerUnit.stringValue
    }
    
    @IBAction func priceTextFieldChanged(_ sender: UITextField) {
    
    }

}
