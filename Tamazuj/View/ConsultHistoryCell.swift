//
//  ConsultHistoryCell.swift
//  Tamazuj
//
//  Created by yousef Omar on 9/17/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class ConsultHistoryCell: UITableViewCell {

    @IBOutlet weak var coStutes: UILabel!
    @IBOutlet weak var conTime: UILabel!
    @IBOutlet weak var nameCon: UILabel!
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
/*cell.nameCon.text = object.consultant_id?.name
 cell.coPhoto.kf.setImage(with: URL(string: (object.consultant_id?.photo)!))
 cell.coStutes.text = object.status
 cell.coTime.text = object.session_time?.time*/
