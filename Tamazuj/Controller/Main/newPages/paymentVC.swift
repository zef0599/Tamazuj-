//
//  paymentVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 11/19/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class paymentVC: UIViewController, OPPCheckoutProviderDelegate {
    
    @IBAction func checkoutButtonAction(_ sender: UIButton) {
        // Set a delegate property for the OPPCheckoutProvider instance
//        checkoutProvider.delegate =÷= self
        
        Operation.geCheckout (amount:100) {(error, result) in
            if let result = result {
                self.checkout = result
                let provider = OPPPaymentProvider(mode: .test)
                
                
                let checkoutSettings = OPPCheckoutSettings()
                
                // Set available payment brands for your shop
                checkoutSettings.paymentBrands = ["VISA"]
                
                // Set shopper result URL
                checkoutSettings.shopperResultURL = "com.companyname.appname.payments://result"
                guard let checkoutId = result.id else {
                    print("no ch iddddd")
                    return
                }
                print(checkoutId)
                let checkoutProvider = OPPCheckoutProvider(paymentProvider: provider, checkoutID: checkoutId, settings: checkoutSettings)
                
                checkoutProvider?.presentCheckout(forSubmittingTransactionCompletionHandler: { (transaction, error) in
                    guard let transaction = transaction else {
                        // Handle invalid transaction, check error
                        return
                    }
                    
                    if transaction.type == .synchronous {
                        // If a transaction is synchronous, just request the payment status
                        // You can use transaction.resourcePath or just checkout ID to do it
                        
                        Operation.gePaymentStatus(amount: 100, completion: { (error, result) in
                            if let result = result {
                                
                            }
                        })
//                        //>>>>>>>>>>>>>>
//                        let url = String(format: "https://YOUR_URL/paymentStatus?resourcePath=%@", transaction.resourcePath!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
//                        let merchantServerRequest = NSURLRequest(url: URL(string: url)!)
//                        URLSession.shared.dataTask(with: PaymentStatus) { data, response, error in
//                            if let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                                let transactionStatus = json?["paymentResult"] as? Bool
//                            }
//                            }.resume()
//                         //>>>>>>>>>>>>>>

                    } else if transaction.type == .asynchronous {
                        // The SDK opens transaction.redirectUrl in a browser
                        // See 'Asynchronous Payments' guide for more details
                    } else {
                        // Executed in case of failure of the transaction for any reason
                    }
                }, cancelHandler: {
                    // Executed if the shopper closes the payment page prematurely
                })
                
                
            }
        }
    }
    
    // Implement a callback, it will be called right before submitting a transaction to the Server
    func checkoutProvider(_ checkoutProvider: OPPCheckoutProvider, continueSubmitting transaction: OPPTransaction, completion: @escaping (String?, Bool) -> Void) {
        // To continue submitting you should call completion block which expects 2 parameters:
        // checkoutID - you can create new checkoutID here or pass current one
        // abort - you can abort transaction here by passing 'true'
        completion(transaction.paymentParams.checkoutID, false)
    }
    
    //Security. Disable third party keyboards
    func application(_ application: UIApplication, shouldAllowExtensionPointIdentifier extensionPointIdentifier: UIApplication.ExtensionPointIdentifier) -> Bool {
        if (extensionPointIdentifier == UIApplication.ExtensionPointIdentifier.keyboard) {
            return false
        }
        return true
    }


    
    
    var checkout:Checkout?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    


}
