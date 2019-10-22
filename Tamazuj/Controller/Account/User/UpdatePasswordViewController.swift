//
//  UpdatePasswordViewController.swift
//  Tamazuj
//
//  Created by osama abu dahi on 03/10/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class UpdatePasswordViewController: UIViewController {

    @IBOutlet weak var oldpasswored: UITextField!
    @IBOutlet weak var newpasswored: UITextField!
    @IBOutlet weak var conifrmepasswored: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func done(_ sender: Any) {
        
            guard let oldpass   = self.oldpasswored.text,
                let newpass   = self.newpasswored.text,
                let confPadd  = self.conifrmepasswored.text
                else {
                    self.showHUD(title: "", details: "يرجى التاكد من البيانات المدخلةچ" , hideAfter: 1)
                    return
                    
            }
            
            Operation.updatePasswored(lang: "ar", Authorization: "Bearer \(helper.getUserToken()!)", oldPassword: oldpass, newPass: newpass, ConfPass: confPadd) { (error, suc) in
                if suc?.status != "0" {
                    
                    let massage = suc?.message
                    let status = suc?.status
                    print(massage)
                    print(status)
                    
                    self.showHUD(title: "", details: massage ?? "error data" , hideAfter: 1)
                }
                
            }
        }
    
    }
    
    
    
    
    
    

