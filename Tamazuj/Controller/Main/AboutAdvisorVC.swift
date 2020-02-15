//
//  AboutAdvisorVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 9/16/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class AboutAdvisorVC: UIViewController {
    
//    var id : Int?
//    static var idUser : Int?
    
    @IBOutlet weak var aboutAdvisor: UIView!
    @IBOutlet weak var comments: UIView!
    @IBOutlet weak var Coment: UIButton!
    
    @IBOutlet weak var advisor: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//         AboutAdvisorVC.idUser = self.id
        
//        print("AboutAdvisorVC = \(AboutAdvisorVC.idUser)")
        
        aboutAdvisor.alpha=1
        comments.alpha=0
        Coment.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        Coment.clipsToBounds = true
        Coment.layer.cornerRadius = 12
        Coment.setTitleColor(#colorLiteral(red: 0.4745098039, green: 0.5176470588, blue: 0.537254902, alpha: 1), for: .normal)
        
        advisor.setTitleColor(#colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 1), for: .normal)
        advisor.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 14)
        advisor.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 0.12)
        advisor.clipsToBounds = true
        advisor.layer.cornerRadius = 12
        Coment.titleLabel?.font = UIFont(name: "Cairo-Regular", size: 14)
        
        
        
        self.navigationController?.navigationBar.backIndicatorImage = UIImage.init(named: "back")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage =  UIImage.init(named: "back")
        self.navigationController?.navigationBar.backItem?.title="Cairo-Regular"
        
        
    }


    
    @IBAction func aboutAdvisorButton(_ sender: Any) {
//        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AboutContainerVC") as! AboutContainerVC
//        vc.id = self.id!
//        self.present(vc, animated: true, completion: nil)
        UIView.animate(withDuration: 0.3, animations: {
            self.aboutAdvisor.alpha = 1
            self.comments.alpha = 0.0
        })
                if aboutAdvisor.alpha == 1 {
            advisor.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 0.12)
            advisor.clipsToBounds = true
            advisor.layer.cornerRadius = 12
            advisor.setTitleColor(#colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 1), for: .normal)
            advisor.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 14)
            
            
            Coment.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            Coment.clipsToBounds = true
            Coment.layer.cornerRadius = 12
            Coment.tintColor = #colorLiteral(red: 0.4745098039, green: 0.5176470588, blue: 0.537254902, alpha: 1)
            Coment.setTitleColor(#colorLiteral(red: 0.4745098039, green: 0.5176470588, blue: 0.537254902, alpha: 1), for: .normal)
            Coment.titleLabel?.font = UIFont(name: "Cairo-Regular", size: 14)
            
            
        }
        
    }
    
    @IBAction func commentButton(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.aboutAdvisor.alpha = 0
            self.comments.alpha = 1
            if self.aboutAdvisor.alpha == 0 {
                self.Coment.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 0.12)
                self.Coment.clipsToBounds = true
                self.Coment.layer.cornerRadius = 12
                self.Coment.setTitleColor(#colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 1), for: .normal)
                self.Coment.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 14)
                
                
                self.advisor.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.advisor.clipsToBounds = true
                self.advisor.layer.cornerRadius = 12
                self.advisor.tintColor = #colorLiteral(red: 0.4745098039, green: 0.5176470588, blue: 0.537254902, alpha: 1)
                self.advisor.setTitleColor(#colorLiteral(red: 0.4745098039, green: 0.5176470588, blue: 0.537254902, alpha: 1), for: .normal)
                self.advisor.titleLabel?.font = UIFont(name: "Cairo-Regular", size: 14)
                
                
            }
//            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReviewsContainer") as! ReviewsContainer
//            vc.id = self.id
//            self.present(vc, animated: true, completion: nil)
        })

        
     
        
        
    }
}
