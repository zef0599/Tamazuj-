//
//  SelectLangVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 10/27/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class SelectLangVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBOutlet weak var selectSA: UIImageView!
    @IBOutlet weak var selectUSA: UIImageView!
    
    @IBAction func save(_ sender: Any) {
    }
    
    @IBAction func exite(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
