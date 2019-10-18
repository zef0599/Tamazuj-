//
//  UIViewController+HUD.swift
//  ISChat
//
//  Created by Khaled Khaldi on 9/19/18.
//  Copyright © 2018 iPhoneAlsham. All rights reserved.
//

import UIKit
import MBProgressHUD

extension UIViewController {
    
    func showHUD(title:String?, details: String? = nil, hideAfter:TimeInterval? = nil) {
        var hud: MBProgressHUD! = MBProgressHUD(for: view)
        if hud == nil {
            hud = MBProgressHUD.showAdded(to: view, animated: true)
        }
        hud.removeFromSuperViewOnHide = true
        
        hud.mode = .text
        hud.label.text = title
        hud.detailsLabel.text = details
        if let hideAfter = hideAfter {
            hud.hide(animated:true, afterDelay:hideAfter)
        }
    }
    
    func showIndeterminateHUD(title:String? = nil, details: String? = nil) {
        var hud: MBProgressHUD! = MBProgressHUD(for: view)
        if hud == nil {
            hud = MBProgressHUD.showAdded(to: view, animated: true)
        }
        hud.removeFromSuperViewOnHide = true

        hud.mode = .indeterminate;
        hud.label.text = title
        hud.detailsLabel.text = details
    }

    func hideHUD(animated:Bool = true) {
        MBProgressHUD.hide(for: view, animated: true)
    }

}
