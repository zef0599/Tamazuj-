//
//  aboutAppVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 10/27/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class aboutAppAdVC: UIViewController {
    
   
    @IBOutlet weak var aboutapp: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        Operation.setting { (error, data) in
            if data?.status == 1 {
                print("sucsses")
                self.aboutapp.text = data?.about_app?.html2String
                //print(data?.about_app)
                
            }
        }
    
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
