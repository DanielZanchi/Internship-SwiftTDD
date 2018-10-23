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
        
        didEnterQuantity(false)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func didEnterQuantity(_ entered: Bool) {
        totalAmountTextField.isEnabled = entered
        priceTextField.isEnabled = entered
    }
    
    func calculatePricePerUnit() -> String {
        let totalAmount: Double = (totalAmountTextField.text?.doubleValue)!
        let quantity: Double = ((quantityTextField.text)?.doubleValue)!
        if quantity == 0 || totalAmount == 0 {
            return "0.00"
        }
        return (totalAmount / quantity).toString(decimals: 3)
    }
    
    func calculateTotalAmount() -> String {
        let pricePerUnit: Double = (priceTextField.text?.doubleValue)!
        let quantity: Double = (quantityTextField.text?.doubleValue)!
        return (pricePerUnit * quantity).toString(decimals: 2)
    }
    
    // MARK: IBActions
    
    @IBAction func quantityTextFieldChanged(_ sender: UITextField) {
        if sender.text?.doubleValue != 0.00 {
            didEnterQuantity(true)
        } else {
            didEnterQuantity(false)
            totalAmountTextField.text = ""
            priceTextField.text = ""
        }
    }

    @IBAction func totalAmountTextFieldChanged(_ sender: UITextField) {
        priceTextField.text = calculatePricePerUnit()
    }
    
    @IBAction func priceTextFieldChanged(_ sender: UITextField) {
        totalAmountTextField.text = calculateTotalAmount()
    }

}



