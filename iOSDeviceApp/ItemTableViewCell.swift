//
//  ItemTableViewCell.swift
//  iOSDeviceApp
//
//  Created by Rakesh on 25/05/19.
//  Copyright © 2019 Subhalaxmi. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var devicePriceLabel: UILabel!
    @IBOutlet weak var deviceAvailabilityLabel: UILabel!
    @IBOutlet weak var deviceImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
       
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
