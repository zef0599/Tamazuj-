//
//  AdUpdatePasswordViewController.swift
//  Tamazuj
//
//  Created by osama abu dahi on 20/10/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class AdUpdatePasswordViewController: UIViewController {

   
    @IBOutlet weak var oldpasswored: UITextField!
    @IBOutlet weak var newpasswored: UITextField!
    @IBOutlet weak var conifrmepasswored: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        //        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func done(_ sender: Any) {
        
        //        dismiss(animated: true) {
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
       ConsultantAth.AdupdatePasswored(lang: "ar", Authorization: "Bearer \(helper.getUserToken()!)", oldPassword: oldpass, newPass: newpass, ConfPass: confPadd) { (error, suc) in
            
            if suc != nil {
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


