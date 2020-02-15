//
//  AdvisorCell.swift
//  Tamazuj
//
//  Created by yousef Omar on 9/16/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class AdvisorCell: UITableViewCell {

    @IBOutlet var stacknametime: UIStackView!
    @IBOutlet var stackreat: UIStackView!
    
    @IBOutlet var icon: UIImageView!
    @IBOutlet var nameicon: UILabel!
    
    
    @IBOutlet var imageUser: UIImageView!
    @IBOutlet var time: UILabel!
    @IBOutlet var name: UILabel!
    @IBOutlet var feedback: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        imageUser.layer.cornerRadius = imageUser.bounds.height / 2
        // Configure the view for the selected state
    }
    
}
