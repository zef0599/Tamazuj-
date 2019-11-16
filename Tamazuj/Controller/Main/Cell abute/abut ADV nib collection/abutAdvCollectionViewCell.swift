//
//  abutAdvCollectionViewCell.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 13/11/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class abutAdvCollectionViewCell: UICollectionViewCell {

    @IBOutlet var titel: UILabel!
    @IBOutlet var bgView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
//        bgView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width - 5).isActive = true // 30 is my added up left and right Inset
//        bgView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        bgView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
//        bgView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
//        bgView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    override func layoutSubviews() {
//    CollectionViewFlowLayout.
        
    }

}
