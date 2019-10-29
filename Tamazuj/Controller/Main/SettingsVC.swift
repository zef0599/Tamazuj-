//
//  SettingsVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 10/26/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func esc(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func toLang(_ sender: Any) {
    }
    
    @IBAction func toConditions(_ sender: Any) {
    }
    
    @IBAction func toPrivice(_ sender: Any) {
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
