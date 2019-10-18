//
//  AccountViewController.swift
//  Tamazuj
//
//  Created by osama abu dahi on 29/09/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    var Account:[String] = ["user","advisoer"]
   

    @IBOutlet weak var User: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "user") {
            // ...
            let data = segue.destination as! SignInViewController
         //   let text = Account[0]
            
             let text = Account[0]
            
            SignInViewController.User = text
            
            
            //       WindowManger.show(.main, animated: true)
            
        } else if (segue.identifier == "advisor") {
            //...
            let text = Account[1]
            
            SignInViewController.User = text
            
            //       WindowManger.show(.Advisor, animated: true)
        }
    }
    
    
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
    
}
