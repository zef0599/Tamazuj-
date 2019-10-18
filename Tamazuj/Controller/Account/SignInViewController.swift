//
//  SignInViewController.swift
//  Tamazuj
//
//  Created by Saadi on 9/6/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

  static var User:String?
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var submit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submit.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        submit.setGradientBackground(colorOne: #colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 1), colorTwo: #colorLiteral(red: 0.3333333333, green: 0.6392156863, blue: 0.8117647059, alpha: 1))
        submit.layer.cornerRadius = 15

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
                
                let user:String
                user = SignInViewController.User!
                print(user)
                
                if user == "user"{
                    self.hideHUD()
                    WindowManger.show(.main, animated: true)
                }
                if user == "advisoer"{
                      self.hideHUD()
                    WindowManger.show(.Advisor, animated: true)
                    
                }
                
            }
                
            }
            
            
        
        }
   

        
    }




