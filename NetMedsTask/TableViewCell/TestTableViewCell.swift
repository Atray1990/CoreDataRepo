
//
//  collectionViewCell.swift
//  FlickerUIViewProject
//
//  Created by shashank atray on 11/09/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//  LinkeIn - https://www.linkedin.com/in/shashank-k-atray/
//

import UIKit


class TestTableViewCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var ivSelectedImage: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblTestType: UILabel!
    @IBOutlet weak var lblAvailable: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ivSelectedImage.layer.cornerRadius = 2
    }
    
    func configureCellValue(testPackage: TestPackage) {
        lblName.text = testPackage.itemName
        lblPrice.text = "Rs\(testPackage.minPrice)"
        lblTestType.text = "Type : \(testPackage.type)"
        lblAvailable.text = "available at \(testPackage.availableAt) location."
    }
    
    func updateSelectedImage(isSelected:Bool) {
        if isSelected {
            ivSelectedImage.image = UIImage(named: "checkmark")
        } else {
           ivSelectedImage.image = UIImage(named: "icon_add")
        }
    }
}
