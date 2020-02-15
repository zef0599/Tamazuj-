//
//  activateCodeVC.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 07/10/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class activateCodeVC: UIViewController {

    
    var phoneNumber = ""
    
    @IBOutlet var phoneTF: UITextField!
    @IBOutlet var CodeTF: UITextField!
    @IBOutlet weak var codeActivet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.phoneTF.text = phoneNumber
        codeActivet.layer.cornerRadius = 15
        codeActivet.setGradientBackground(colorOne: #colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 1), colorTwo: #colorLiteral(red: 0.3333333333, green: 0.6392156863, blue: 0.8117647059, alpha: 1))
        codeActivet.layer.cornerRadius = 15

        hidnskeybored()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        codeActivet.setGradientBackground(colorOne: #colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 1), colorTwo: #colorLiteral(red: 0.3333333333, green: 0.6392156863, blue: 0.8117647059, alpha: 1))
        codeActivet.layer.cornerRadius = 15
        
    }
    
    @IBAction func codeActivet(_ sender: Any) {
        
        guard  let email = phoneTF.text , !email.isEmpty else {
            self.showHUD(title: "", details: "الرجاء ادخال رقم الهاتف ", hideAfter: 1)
            return
        }
        guard  let password = CodeTF.text , !password.isEmpty  else {
            
            self.showHUD(title: "", details:"الرجاء ادخال الكود بشكل صحيح ", hideAfter: 1)
            
            return
            
        }
        
        
        showIndeterminateHUD()
        HomeData.activateCode(phone: "\(self.phoneTF.text!)", activate: "\(self.CodeTF.text!)") { (err, actv) in
            
            guard let actv = actv else{
                self.showHUD(title: "Erorr ?!", details: err?.localizedDescription ?? "Some Erorr", hideAfter: 3)
                return
            }
            
            if actv.token != nil && actv.status == 1  {
                
                            self.hideHUD()
                            helper.saveUserToken(token: actv.token!)
                            WindowManger.show(.main, animated: true)
            }else{
                 self.showHUD(title: "", details: actv.message! + "\n الرجاء ادخال الكود بشكل صحيح ", hideAfter: 3)
            }
        }
    }
    
}
