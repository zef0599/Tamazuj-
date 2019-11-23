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
        guard let oldpass   = self.oldpasswored.text,
            let newpass   = self.newpasswored.text,
            let confPadd  = self.conifrmepasswored.text
            else {
                self.showHUD(title: "", details: "يرجى التاكد من البيانات المدخلةچ" , hideAfter: 1)
                return
                
        }
        
        guard newpass == confPadd else {
            self.showHUD(title: "", details: "", hideAfter: 1)
            return
        }
        
        guard oldpass != newpass else  {
            self.showHUD(title: "", details: "", hideAfter: 1)
            return
        }
        
        ConsultantAth.AdupdatePasswored(lang: "ar", Authorization: "Bearer \(helper.getUserToken()!)", oldPassword: oldpass, newPass: newpass, ConfPass: confPadd) { (error, suc) in
            if suc?.status != "0" {
                
                let massage = suc?.message
                let status = suc?.status
                print(massage)
                print(status)
                
                self.showHUD(title: "", details: massage ?? "error data" , hideAfter: 1)
            }
       
            
        }
 
    
    }}

