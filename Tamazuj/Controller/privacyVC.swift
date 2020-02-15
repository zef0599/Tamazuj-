//
//  privacyViewController.swift
//  Tamazuj
//
//  Created by osama abu dahi on 19/11/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class privacyVC: UIViewController {

    @IBOutlet weak var privisyText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Operation.setting { (error, data) in
            if data?.status == 1 {
                print("sucsses")
                    self.privisyText.text = data?.privacy_app?.html2String
                //print(data?.about_app)
                
            }
        }
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

    @IBAction func exit(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
