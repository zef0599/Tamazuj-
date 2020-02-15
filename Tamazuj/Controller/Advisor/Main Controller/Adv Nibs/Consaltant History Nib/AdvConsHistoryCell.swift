//
//  AdvConsHistoryCell.swift
//  Tamazuj
//
//  Created by yousef Omar on 10/19/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class AdvConsHistoryCell: UITableViewCell {
    
    @IBOutlet weak var coStutes: UILabel!
    @IBOutlet weak var CoTime: UILabel!
    @IBOutlet weak var nameCo: UILabel!
    @IBOutlet weak var coPhoto: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    let margins = UIEdgeInsets(top: 0, left: 0, bottom: 200, right: 0)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //        self.contentView.frame = CGRect(origin: contentView.frame, size: margins)
        
    }
}
