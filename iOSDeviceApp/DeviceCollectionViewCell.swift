//
//  DeviceCollectionViewCell.swift
//  iOSDeviceApp
//
//  Created by Rakesh on 25/05/19.
//  Copyright © 2019 Subhalaxmi. All rights reserved.
//

import UIKit

class DeviceCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var devicePriceLabel: UILabel!
    @IBOutlet weak var deviceAvailabilityLabel: UILabel!
    @IBOutlet weak var deviceImageView: UIImageView!
    @IBOutlet weak var deviceView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        deviceView.layer.cornerRadius = 5.0
        deviceView.layer.shadowColor = UIColor.gray.cgColor
        deviceView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        deviceView.layer.shadowRadius = 5.0
        deviceView.layer.shadowOpacity = 0.7
        // Initialization code
    }
}
