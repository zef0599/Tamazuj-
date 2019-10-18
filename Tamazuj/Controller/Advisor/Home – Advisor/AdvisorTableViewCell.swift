//
//  AdvisorTableViewCell.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 18/09/2019.
//  Copyright © 2019 Mohammed Erbia. All rights reserved.
//

import UIKit

class AdvisorTableViewCell: UITableViewCell {

    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
        view1.layer.cornerRadius = 14
        view1.clipsToBounds = true
        
        view2.backgroundColor = .white
        view2.layer.cornerRadius = 7
        view2.layer.shadowRadius = 7
        view2.layer.shadowColor = #colorLiteral(red: 0.8823529412, green: 0.9098039216, blue: 0.9215686275, alpha: 1)
        
        view2.layer.masksToBounds = false
        view2.layer.shadowOffset = CGSize(width: -1, height: 1)
        view2.layer.shadowOpacity = 1
        
//        view2.layer.cornerRadius = 7
//        view2.clipsToBounds = true
//        view2.layer.shadowColor = #colorLiteral(red: 0.9764705882, green: 0.9803921569, blue: 0.9843137255, alpha: 1)
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
