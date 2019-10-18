//
//  NotificationsTableViewCell.swift
//  Tamazuj
//
//  Created by osama abu dahi on 15/09/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class NotificationsTableViewCell: UITableViewCell {

    @IBOutlet weak var NotificationImage: UIImageView!
    @IBOutlet weak var NotificationText: UILabel!
    @IBOutlet weak var NotificationTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
