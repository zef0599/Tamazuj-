//
//  SignUpVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 9/16/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var passTextagin: UITextField!
    @IBOutlet weak var textNumber: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton.layer.cornerRadius = 15

        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signUpButton.setGradientBackground(colorOne: #colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 1), colorTwo: #colorLiteral(red: 0.3333333333, green: 0.6392156863, blue: 0.8117647059, alpha: 1))
        signUpButton.layer.cornerRadius = 15
    }
    @IBAction func submit(_ sender: Any) {
    }
    @IBAction func Register(_ sender: Any) {
        
        guard let name       = textName.text ,
              let email      = textEmail.text ,
              let passwored  = passText.text,
              let phone      = textNumber .text
            else {
            return
        }
        
//      if  passwored == passTextagin.text {
//
//        }
//        else
//
//        {return}
        
        showIndeterminateHUD()
        Operation.Register(name: name, email: email, phone: phone, password: passwored) { (Ath, error) in
            self.hideHUD()
                let massege =  Ath?.message
                self.showHUD(title: "", details: massege, hideAfter: 1)}
        
    }
    
}
//            if Ath?.status == 1 {
//                let viewController = storyboard?.instantiateViewController(withIdentifier: "dd") as! UIViewController
//
//            }

