//
//  WindowManger.swift
//  EW2_Storybords1
//
//  Created by Khaled Khaldi on 1/20/19.
//  Copyright © 2019 Sky Geeks. All rights reserved.
//

import UIKit


enum StoryboardName: String {
    
    case account  = "Account"
    case main     = "Main"
    case Advisor = "Advisor"
    case userAccount = "User"
    case AdvisorAccount = "AdvisorAccount"
    
    
}

class WindowManger {

    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    static func show(_ storyboard: StoryboardName, identifier: String? = nil, animated: Bool) {

        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let controller: UIViewController?
        if let identifier = identifier {
            controller = storyboard.instantiateViewController(withIdentifier: identifier)
        } else {
            controller = storyboard.instantiateInitialViewController()
        }
        
        if let controller = controller {
            
            if animated {
                UIView.transition(with: appDelegate.window!, duration: 0.35, options: [.transitionCrossDissolve], animations: {
                    appDelegate.window?.rootViewController = controller

                }, completion: nil)
                
            } else {
                appDelegate.window?.rootViewController = controller
            }
            
        }
        
    }

    
}
