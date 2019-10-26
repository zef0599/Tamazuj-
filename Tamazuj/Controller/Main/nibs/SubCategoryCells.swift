//
//  SubCategoryCells.swift
//  Tamazuj
//
//  Created by yousef Omar on 10/26/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class SubCategoryCells: UITableViewCell {

    @IBOutlet weak var leading: UIView!
    @IBOutlet weak var traling: UIView!
    @IBOutlet weak var bottom: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
