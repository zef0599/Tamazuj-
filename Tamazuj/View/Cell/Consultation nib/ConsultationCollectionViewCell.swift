//
//  ConsultationCollectionViewCell.swift
//  Tamazuj
//
//  Created by yousef Omar on 9/15/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class ConsultationCollectionViewCell: UICollectionViewCell {

    @IBOutlet var image: UIImageView!
    @IBOutlet var titel: UILabel!
    @IBOutlet var subTitel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        image.layer.cornerRadius =  23
//        image.layer.maskedCorners = [.layerMaxXMinYCorner  , .layerMinXMinYCorner ,.layerMinXMaxYCorner ]
        image.layer.masksToBounds = true
        
        subTitel.layer.cornerRadius = 14
        subTitel.layer.masksToBounds = true
    }

}
