//
//  RatingVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 11/15/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class RatingVC: UIViewController {

    @IBOutlet weak var SB1: UIButton!
    @IBOutlet weak var SB2: UIButton!
    @IBOutlet weak var SB3: UIButton!
    @IBOutlet weak var SB4: UIButton!
    @IBOutlet weak var SB5: UIButton!
    
    @IBOutlet weak var R1: UIButton!
    @IBOutlet weak var R2: UIButton!
    @IBOutlet weak var R3: UIButton!
    @IBOutlet weak var R4: UIButton!
    @IBOutlet weak var R5: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RateConButtonsBW()
        serviceRateButtonsBW()

    }
    
    @IBAction func SB1(_ sender: Any) {
        serviceRateButtonsBW()
        SB1.setImage(UIImage(named:"emoj-1"), for: .normal)
    }
    
    @IBAction func SB2(_ sender: Any) {
        serviceRateButtonsBW()
        SB2.setImage(UIImage(named:"emoj-2"), for: .normal)
    }
    @IBAction func SB3(_ sender: Any) {
        serviceRateButtonsBW()
        SB3.setImage(UIImage(named:"emoj-3"), for: .normal)
    }
    @IBAction func SB4(_ sender: Any) {
        serviceRateButtonsBW()
        SB4.setImage(UIImage(named:"emoj-4"), for: .normal)
    }
    
    @IBAction func SB5(_ sender: Any) {
        serviceRateButtonsBW()
        SB5.setImage(UIImage(named:"emoj-5"), for: .normal)
    }
    
    
    @IBAction func R1(_ sender: Any) {
        RateConButtonsBW()
        R1.setImage(UIImage(named:"emo-1"), for: .normal)
    }
    @IBAction func R2(_ sender: Any) {
        RateConButtonsBW()
        R2.setImage(UIImage(named:"emo-2"), for: .normal)
    }
    
    @IBAction func R3(_ sender: Any) {
        RateConButtonsBW()
        R3.setImage(UIImage(named:"emo-3"), for: .normal)
    }
    @IBAction func R4(_ sender: Any) {
        RateConButtonsBW()
        R4.setImage(UIImage(named:"emo-4"), for: .normal)
    }
    
    @IBAction func R5(_ sender: Any) {
        RateConButtonsBW()
        R5.setImage(UIImage(named:"emo-5"), for: .normal)
    }
    
    func serviceRateButtonsBW(){
        SB1.setImage(#imageLiteral(resourceName: "emoj-un-1.png"), for: .normal)
        SB2.setImage(#imageLiteral(resourceName: "emoj-un-2.png"), for: .normal)
        SB3.setImage(#imageLiteral(resourceName: "emoj-un-3.png"), for: .normal)
        SB4.setImage(#imageLiteral(resourceName: "emoj-un-4.png"), for: .normal)
        SB5.setImage(#imageLiteral(resourceName: "emoj-un-5.png"), for: .normal)
    }
    func RateConButtonsBW(){
        R1.setImage(UIImage(named:"emoj--a"), for: .normal)
        R2.setImage(UIImage(named:"emoj--b"), for: .normal)
        R3.setImage(UIImage(named:"emoj--c"), for: .normal)
        R4.setImage(UIImage(named:"emoj--d"), for: .normal)
        R5.setImage(UIImage(named:"emoj--e"), for: .normal)
    }

    
}
