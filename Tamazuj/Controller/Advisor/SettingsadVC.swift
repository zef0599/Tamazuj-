//
//  SettingsVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 10/26/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class SettingsadVC: UIViewController {
    var lang = ""
    @IBOutlet weak var langugeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SelectLangVC") as! SelectLangVC
        vc.delegate = self
        print("lang")
        print(lang)
        langugeLabel.text=lang
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

}
extension SettingsadVC: StringDelegat {
    func langugeDelegate(languge: String) {
        self.lang = languge
        self.reloadInputViews()
    }
}
