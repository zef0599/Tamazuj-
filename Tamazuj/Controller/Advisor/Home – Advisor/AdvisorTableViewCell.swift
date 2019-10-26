//
//  AdvisorTableViewCell.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 18/09/2019.
//  Copyright © 2019 Mohammed Erbia. All rights reserved.
//

import UIKit

protocol AdvisorTableViewCellDelgat{
    func advisorTableViewCellDelegat(_ Cell : AdvisorTableViewCell )
}


class AdvisorTableViewCell: UITableViewCell {
    
    var delegat : AdvisorTableViewCellDelgat?
    
    @IBOutlet var timeCons: UILabel!
    @IBOutlet var imageCons: UIImageView!
    @IBOutlet var typeConslt: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func DeletConsaltent(_ sender: Any) {
        delegat?.advisorTableViewCellDelegat(self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
