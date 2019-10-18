//
//  AboutContainerVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 9/16/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class AboutContainerVC: UIViewController {
    
    
    
    @IBOutlet weak var labels2: UILabel!
    @IBOutlet weak var lableM: UILabel!
    @IBOutlet weak var labelTraling: UILabel!
    @IBOutlet weak var askCon: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        lablesClipAndCorner()
//        print("AboutContainerVC = \(AboutAdvisorVC.idUser)")
//        self.navigationItem.setHidesBackButton(true, animated:true)
//        self.navigationItem.hidesBackButton = true
//        self.navigationController?.isNavigationBarHidden = true
//        self.navigationItem.setHidesBackButton(true, animated: true)
//        // Do any additional setup after loading the view.
    }
//    @IBAction func back(_ sender: Any) {
//       self.navigationController?.popViewController(animated: true)
//    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    


    func lablesClipAndCorner(){
        labels2.layer.cornerRadius = 14
        labels2.clipsToBounds=true
        lableM.layer.cornerRadius = 14
        lableM.clipsToBounds=true
        labelTraling.layer.cornerRadius = 14
        labelTraling.clipsToBounds=true

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        askCon.setGradientBackground(colorOne: #colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 1), colorTwo: #colorLiteral(red: 0.3333333333, green: 0.6392156863, blue: 0.8117647059, alpha: 1))
        askCon.layer.cornerRadius = 15
        
    }

}
