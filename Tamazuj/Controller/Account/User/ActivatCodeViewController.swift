//
//  ActivatCodeViewController.swift
//  Tamazuj
//
//  Created by osama abu dahi on 17/10/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class ActivatCodeViewController: UIViewController {
    var phoneNumber = ""
    
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var codeText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.phoneText.text = phoneNumber
        codeText.layer.cornerRadius = 15
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        codeText.setGradientBackground(colorOne: #colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 1), colorTwo: #colorLiteral(red: 0.3333333333, green: 0.6392156863, blue: 0.8117647059, alpha: 1))
        codeText.layer.cornerRadius = 15
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func submit(_ sender: Any) {
        
        guard  let phone = phoneText.text , !phone.isEmpty else {
            self.showHUD(title: "", details: "الرجاء ادخال رقم الهاتف ", hideAfter: 1)
            return
        }
        guard  let Code = codeText.text , !Code.isEmpty  else {
            
            self.showHUD(title: "", details:"الرجاء ادخال الكود بشكل صحيح ", hideAfter: 1)
            
            return
            
        }
        
        
        showIndeterminateHUD()
         ConsultantAth.activateCode(phone: phone, activate: Code) { (err, actv) in
            
            guard let actv = actv else{
                self.showHUD(title: "Erorr ?!", details: err?.localizedDescription ?? "Some Erorr", hideAfter: 3)
                return
            }
            
            if actv.token != nil && actv.status == 1  {
                
                self.hideHUD()
                helper.saveApiToken(token: actv.token!) 
                WindowManger.show(.main, animated: true)
            }else{
                self.showHUD(title: "", details: actv.message! + "\n الرجاء ادخال الكود بشكل صحيح ", hideAfter: 3)
            }
        }
    }
        
        
    }

