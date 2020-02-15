//
//  conditionsVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 10/27/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class conditionsAdVC: UIViewController {

    @IBOutlet weak var CondtionText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Operation.setting { (error, data) in
            if data?.status == 1 {
                print("sucsses")
                self.CondtionText.text = data?.condition?.html2String
                //print(data?.about_app)
                
            }
        }
    }
    
    
    @IBAction func esc(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
