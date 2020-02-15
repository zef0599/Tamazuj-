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
        guard let oldpass   = self.oldpasswored.text, !oldpass.isEmpty else {
            self.showHUD(title: "", details: "الرجاء ادخال كلمة المرور القديمة", hideAfter: 3)
            return
        }
        guard let newpass   = self.newpasswored.text, !newpass.isEmpty else {
            self.showHUD(title: "", details: "الرجاء ادخال كلمة المرور الجديدة", hideAfter: 3)
            return
        }
        guard let confPadd   = self.conifrmepasswored.text, !confPadd.isEmpty else {
            self.showHUD(title: "", details: "الرجاء ادخال كلمة المرور مرة اخر", hideAfter: 3)
            return
        }
        
        guard newpass == confPadd else {
            self.showHUD(title: "", details: "الرجاء التاكد من كتابة كلمة المرور بشكل صحيح", hideAfter: 3)
            return
        }
            self.showIndeterminateHUD()
        Operation.updatePasswored(lang: "ar", Authorization: "Bearer \(helper.getUserToken()!)", oldPassword: oldpass, newPass: newpass, ConfPass: confPadd) { (error, suc) in
            
            if suc != nil {
                self.hideHUD()
                self.showHUD(title: "", details: "\(suc?.message)", hideAfter: 3)
                print(suc?.message)

            }
            if  suc?.status  == "0"{
                self.hideHUD()
                self.showHUD(title: "", details: "\(suc?.message)", hideAfter: 3)
                print(suc?.message)
            }else if suc?.status  == "1"{
                self.hideHUD()
                self.showHUD(title: "", details: "\(suc?.message)", hideAfter: 3)

            }
        }}
    
    
}
    
    
    

