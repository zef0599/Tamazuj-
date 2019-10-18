//
//  UserLoginViewController.swift
//  Tamazuj
//
//  Created by osama abu dahi on 02/10/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class UserLoginViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var submit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        submit.layer.cornerRadius = 15
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        submit.setGradientBackground(colorOne: #colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 1), colorTwo: #colorLiteral(red: 0.3333333333, green: 0.6392156863, blue: 0.8117647059, alpha: 1))
        submit.layer.cornerRadius = 15
        
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
        WindowManger.show(.account, animated: true)
    }
    @IBAction func login(_ sender: Any) {
        
        guard  let email = txtEmail.text , !email.isEmpty else {
            self.showHUD(title: "", details: "الرجاء ادخال البريد الالكتروني", hideAfter: 1)
            return
        }
        guard  let password = txtPassword.text , !password.isEmpty  else {
            
            self.showHUD(title: "", details:" الرجاء ادخال كلمة المرور", hideAfter: 1)
            
            return
            
        }
        
        showIndeterminateHUD()
        Operation.login(email: email, password: password) { (suc, error) in
            
            if suc?.token != nil && suc?.status == 1  {
                    self.hideHUD()
                    WindowManger.show(.main, animated: true)
              
                
            }else{
                self.hideHUD()
                self.showHUD(title: "", details: suc!.message ?? "يرجى التاكد من البيانات ", hideAfter: 3)

            }
            
        }
        
        
        
    }
    @IBAction func unwindToThisViewController(segue: UIStoryboardSegue) {
        print("IM BACK")
    }
}
