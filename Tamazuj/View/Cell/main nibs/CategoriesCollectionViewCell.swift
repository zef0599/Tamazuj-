//
//  CategoriesCollectionViewCell.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 15/09/2019.
//  Copyright © 2019 Mohammed Erbia. All rights reserved.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageCell: UIImageView!
    @IBOutlet var labalCell: UILabel!
    fileprivate func extractedFunc() {
        // Initialization code
        self.backgroundColor = .white
        self.layer.cornerRadius = 7
        self.layer.shadowRadius = 7
        self.layer.shadowColor = #colorLiteral(red: 0.8823529412, green: 0.9098039216, blue: 0.9215686275, alpha: 1)
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowOpacity = 1
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        extractedFunc()
    }

}
