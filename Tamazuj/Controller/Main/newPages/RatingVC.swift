//
//  RatingVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 11/15/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class RatingVC: UIViewController {
    var rating:String?
    var note:String?
    var consaltationId:Int = 34
    
    
    @IBOutlet weak var noteTextView: UITextView!

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
        
        noteTextView.text = "اكتب ملاحظاتك هنا"
        noteTextView.textColor = UIColor.lightGray
        noteTextView.font = UIFont(name: "Cairo-Regular", size: 14.0)
        noteTextView.returnKeyType = .done
        noteTextView.delegate = self

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
        self.rating = "1"

    }
    @IBAction func R2(_ sender: Any) {
        RateConButtonsBW()
        R2.setImage(UIImage(named:"emo-2"), for: .normal)
        self.rating = "2"

    }
    
    @IBAction func R3(_ sender: Any) {
        RateConButtonsBW()
        R3.setImage(UIImage(named:"emo-3"), for: .normal)
        self.rating = "3"

    }
    @IBAction func R4(_ sender: Any) {
        RateConButtonsBW()
        R4.setImage(UIImage(named:"emo-4"), for: .normal)
        self.rating = "4"

    }
    
    @IBAction func R5(_ sender: Any) {
        RateConButtonsBW()
        R5.setImage(UIImage(named:"emo-5"), for: .normal)
        self.rating = "5"

            self.rating = "5"
        }
        @IBAction func submet(_ sender: Any) {
            
            
            if let rating = self.rating, let note = noteTextView.text {
                showIndeterminateHUD()
                Operation.Rating(rating: rating, note: note, consaltationId: consaltationId) { (error, result) in
                    self.hideHUD()
                    if let result = result {
                        // done we update the rate now
                        print(result)
                        print("result")
                        // go to the next page
                        print("go to the next page")
                    }
                }
                
            }else{
                showHUD(title: "نتمنى ان تكمل التقييم ", details: "يجب انهاء التقييم للانتقال ", hideAfter: 2)
            }

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

extension RatingVC:UITextViewDelegate{
    // - for textview placholder-textView
    //MARK:- UITextViewDelegates
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "اكتب ملاحظاتك هنا" {
            textView.text = ""
            textView.textColor = UIColor.black
            textView.font = UIFont(name: "Cairo-Regular", size: 14.0)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "اكتب ملاحظاتك هنا"
            textView.textColor = UIColor.lightGray
            textView.font = UIFont(name: "Cairo-Regular", size: 14.0)
        }
    }

}
