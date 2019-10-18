//
//  UserSginUpViewController.swift
//  Tamazuj
//
//  Created by osama abu dahi on 02/10/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class UserSginUpViewController: UIViewController {
    
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var passTextagin: UITextField!
    @IBOutlet weak var textNumber: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        signUpButton.layer.cornerRadius = 15
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signUpButton.setGradientBackground(colorOne: #colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 1), colorTwo: #colorLiteral(red: 0.3333333333, green: 0.6392156863, blue: 0.8117647059, alpha: 1))
        signUpButton.layer.cornerRadius = 15
    }
    @IBAction func submit(_ sender: Any) {
        

        
    }
    @IBAction func Register(_ sender: Any) {
        
        guard let name     = textName.text ,
            let email      = textEmail.text ,
            let passwored  = passText.text,
            let phone      = textNumber .text,
            let pssagine   = passTextagin.text
            else {
                return
        }
        

        
        showIndeterminateHUD()
        Operation.Register(name: name, email: email, phone: phone, password: passwored) { (Ath, error) in
            let massege =  Ath?.message
            let code =  Ath?.code
            self.hideHUD(animated: true)
            print("\(massege ?? "error massege")")
            print("\(code ?? 0000)")

            if Ath?.status ?? 0 == 0 {
                self.showHUD(title: "", details: massege! ?? "يرجى التاكد من البيانات ", hideAfter: 3)
            }else{
                let alert = UIAlertController(title: massege ?? "" , message: " \(code ?? 0000) \n يرجى حفظ الكود لكتابته الان  ", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "موافق", style: .cancel, handler: { (UIAlertAction) in
                    let stprybord = UIStoryboard(name: "User", bundle: nil)
                    let vc = stprybord.instantiateViewController(withIdentifier: "activateCodeVC") as! activateCodeVC
                    vc.phoneNumber = phone
                     self.present(vc, animated: true, completion: nil)
                    
                }))
                if passwored == pssagine {
                        self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    self.showHUD(title: "", details: "الرجاء التاكد من تطابق كلمة المرور ", hideAfter: 3)
                }
            }
      
        }
    }
}
