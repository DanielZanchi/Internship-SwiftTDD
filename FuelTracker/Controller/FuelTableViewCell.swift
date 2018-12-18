//
//  FuelTableViewCell.swift
//  FuelTracker
//
//  Created by Daniel Zanchi on 18/12/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import UIKit

class FuelTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var consumptionLabel: UILabel!
    @IBOutlet weak var pricePerUnitLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(model: FuelViewModel, distance: Int, consumption: Double) {
        dateLabel.text = model.date
        pricePerUnitLabel.text = ("\(model.pricePerUnit!) €/L")
        priceLabel.text = ("\(model.price!) €")
        distanceLabel.text = "\(distance) km"
        consumptionLabel.text = consumption.toString(decimals: 2)
    }

}
