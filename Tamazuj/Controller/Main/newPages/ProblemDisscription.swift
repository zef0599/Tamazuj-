//
//  ProblemDisscription.swift
//  Tamazuj
//
//  Created by yousef Omar on 10/27/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class ProblemDisscription: UIViewController {

    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var submitView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        submit.setGradientBackground(colorOne: #colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 1), colorTwo: #colorLiteral(red: 0.3333333333, green: 0.6392156863, blue: 0.8117647059, alpha: 1))
        submit.layer.cornerRadius = 15
        
        submitView.setGradientBackground(colorOne: #colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 1), colorTwo: #colorLiteral(red: 0.3333333333, green: 0.6392156863, blue: 0.8117647059, alpha: 1))
        submitView.layer.cornerRadius = 15
    }
    

}
