//
//  AdvisorTableViewCell.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 18/09/2019.
//  Copyright © 2019 Mohammed Erbia. All rights reserved.
//

import UIKit

class AdvisorTableViewCell: UITableViewCell {
    
    
    @IBOutlet var timeCons: UILabel!
    @IBOutlet var imageCons: UIImageView!
    @IBOutlet var typeConslt: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
