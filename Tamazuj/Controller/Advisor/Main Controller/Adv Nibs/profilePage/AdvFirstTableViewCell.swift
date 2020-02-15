//
//  AdvFirstTableViewCell.swift
//  Tamazuj
//
//  Created by yousef Omar on 10/19/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class AdvFirstTableViewCell: UITableViewCell {
    var nav:UINavigationController?
    var profileData:AdvProfile?
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    @IBAction func back(_ sender: Any) {
        self.nav?.popViewController(animated: true)
        
    }
    
    @IBAction func editePage(_ sender: Any) {
        
        let storyboardd = UIStoryboard(name: "Advisor", bundle: nil)
        let vcc = storyboardd.instantiateViewController(withIdentifier: "AdvEditProfaileVC") as! AdvEditProfaileVC
        vcc.profileData = self.profileData
        self.nav?.pushViewController(vcc, animated: true)
        
    }
    
}
