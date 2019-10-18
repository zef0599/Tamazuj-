//
//  imageCollectionViewCell.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 16/09/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class sliderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var requestConsaltation: UIButton!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titel: UILabel!
    @IBOutlet var descriptioN: UILabel!
    @IBOutlet var viewContent: UIView!
    @IBOutlet var reating: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
       viewContent.backgroundColor = .white
       viewContent.layer.cornerRadius = 7
       viewContent.layer.shadowRadius = 7
       viewContent.layer.shadowColor = #colorLiteral(red: 0.8823529412, green: 0.9098039216, blue: 0.9215686275, alpha: 1)
       
       viewContent.layer.masksToBounds = false
       viewContent.layer.shadowOffset = CGSize(width: -1, height: 1)
       viewContent.layer.shadowOpacity = 1
        
        imageView.layer.cornerRadius =  23
        imageView.layer.maskedCorners = [.layerMaxXMinYCorner  , .layerMinXMinYCorner ,.layerMinXMaxYCorner ]
        imageView.layer.masksToBounds = true
    
    }
    
//    @IBAction func go(_ sender: Any) {
//
//        let stprybord = UIStoryboard(name: "Main", bundle: nil)
//        let vc = stprybord.instantiateViewController(withIdentifier: "AdvisorDetailsVC") as! UIViewController
//        UIApplication.shared.keyWindow?.rootViewController?.present(vc, animated: true, completion: nil)
//    }
    
}
//extension UICollectionViewCell {
//    func showAdvisorDetailsVC() {
//        let AdvisorDetails = AdvisorDetailsVC.init(nibName: "AdvisorDetailsVC", bundle: nil)
//        //Present
//        AdvisorDetails.modalTransitionStyle = .crossDissolve
//        AdvisorDetails.modalPresentationStyle = .overCurrentContext
//        self.present(AdvisorDetails, animated: true, completion: nil)
//    }
//
//}
