//
//  AccountViewController.swift
//  Tamazuj
//
//  Created by osama abu dahi on 29/09/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
   // var Account:[String] = ["user","advisoer"]
   

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
       
    }
    
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier == "user") {
//
//            let data = segue.destination as! SignInViewController
//            let text = Account[0]
//
//            SignInViewController.User = text
//
//
//        } else if (segue.identifier == "advisor") {
//
//            let text = Account[1]
//
//            SignInViewController.User = text
//        }
//    }
   
    
    
    
    @IBAction func user(_ sender: Any) {
        WindowManger.show(.userAccount, animated: true)
        
    }
    
    @IBAction func advisor(_ sender: Any) {
        
        WindowManger.show(.AdvisorAccount, animated: true)
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
