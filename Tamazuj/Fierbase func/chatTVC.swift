//
//  chatTVC.swift
//  cahtTese
//
//  Created by Mohammed Erbia on 11/11/2019.
//  Copyright © 2019 Mohammed Erbia. All rights reserved.
//

import UIKit

class chatTVC: UITableViewCell {
    
    enum typemasseg {
        case income
        case outgoing
        
    }
    
    @IBOutlet var userimageleaging: UIImageView!
    @IBOutlet var stackContent: UIStackView!
    @IBOutlet var userimagetrailing: UIImageView!
    @IBOutlet var imagebubbleading: UIImageView!
    @IBOutlet var imagebubbtrailing: UIImageView!
    
    @IBOutlet var viewMasseg: UIView!
    @IBOutlet var username: UILabel!
    
    @IBOutlet var time: UILabel!
    
    @IBOutlet var masseg: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        viewMasseg.layer.cornerRadius = 15
        viewMasseg.layer.maskedCorners = [.layerMaxXMaxYCorner , .layerMaxXMinYCorner ,.layerMinXMaxYCorner , .layerMinXMinYCorner]
    }
    
    
    func massegtype(type : typemasseg){
        if type == .income{

            viewMasseg.layer.maskedCorners = [.layerMaxXMaxYCorner  ,.layerMinXMaxYCorner , .layerMinXMinYCorner]
            time.textAlignment = .left
            stackContent.alignment = .leading
            userimagetrailing.isHidden = true
            imagebubbtrailing.isHidden = true
            userimageleaging.isHidden = false
            imagebubbleading.isHidden = false
            viewMasseg.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.6392156863, blue: 0.8117647059, alpha: 1)
        }else if type == .outgoing{
            
            viewMasseg.layer.maskedCorners = [.layerMaxXMaxYCorner , .layerMaxXMinYCorner ,.layerMinXMaxYCorner ]
            time.textAlignment = .right
            userimageleaging.isHidden = true
            imagebubbleading.isHidden = true
            userimagetrailing.isHidden = false
            imagebubbtrailing.isHidden = false
            stackContent.alignment = .trailing
            viewMasseg.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 1)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
