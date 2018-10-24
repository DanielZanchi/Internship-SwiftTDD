//
//  AddFuelViewController.swift
//  FuelTracker
//
//  Created by Daniel Zanchi on 16/10/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import UIKit

class AddFuelViewController: UIViewController {
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var mileageTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var totalAmountTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    
    var fuel: Fuel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(AddFuelViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        
        didEnterQuantity(false)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func checkTextFieldsContent() {
        if quantityTextField.text?.doubleValue != 0.00 && mileageTextField.text?.doubleValue != 0.00 {
            didEnterQuantity(true)
        } else {
            didEnterQuantity(false)
            totalAmountTextField.text = ""
            priceTextField.text = ""
        }
    }
    
    private func didEnterQuantity(_ entered: Bool) {
        saveButton.isEnabled = entered
        totalAmountTextField.isEnabled = entered
        priceTextField.isEnabled = entered
    }
    
    private func calculatePricePerUnit() -> String {
        let totalAmount: Double = (totalAmountTextField.text?.doubleValue)!
        let quantity: Double = ((quantityTextField.text)?.doubleValue)!
        if quantity == 0 || totalAmount == 0 {
            return "0.00"
        }
        return (totalAmount / quantity).toString(decimals: 3)
    }
    
    private func calculateTotalAmount() -> String {
        let pricePerUnit: Double = (priceTextField.text?.doubleValue)!
        let quantity: Double = (quantityTextField.text?.doubleValue)!
        return (pricePerUnit * quantity).toString(decimals: 2)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
                
        let date: Date = Date()
        let mileage: UInt = (mileageTextField.text?.UIntValue)!
        let quantity: Double = (quantityTextField.text?.doubleValue)!
        let pricePerUnit: Double = (priceTextField.text?.doubleValue)!

        fuel = Fuel(date: date, mileage: mileage, quantity: quantity, pricePerUnit: pricePerUnit)
    }
    
    // MARK: IBActions
    
    @IBAction func quantityTextFieldChanged(_ sender: UITextField) {
        checkTextFieldsContent()
    }
    
    @IBAction func mileageTextFieldChanged(_ sender: UITextField) {
        checkTextFieldsContent()
    }

    @IBAction func totalAmountTextFieldChanged(_ sender: UITextField) {
        priceTextField.text = calculatePricePerUnit()
    }
    
    @IBAction func priceTextFieldChanged(_ sender: UITextField) {
        totalAmountTextField.text = calculateTotalAmount()
    }
    
}
