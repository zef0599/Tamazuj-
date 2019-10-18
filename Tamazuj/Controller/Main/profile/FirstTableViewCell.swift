//
//  FirstTableViewCell.swift
//  Tamazuj
//
//  Created by yousef Omar on 10/3/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit
protocol GofromNib {
    func goToEdite()
}
class FirstTableViewCell: UITableViewCell {
    var nav:UINavigationController?
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

        let storyboardd = UIStoryboard(name: "Main", bundle: nil)
        let vcc = storyboardd.instantiateViewController(withIdentifier: "EditProfailUserViewController") as! EditProfailUserViewController
        self.nav?.pushViewController(vcc, animated: true)

    }
    
}
