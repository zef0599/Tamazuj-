//
//  NewExtensions.swift
//  math in my school
//
//  Created by MohAwad on 19/07/2019.
//  Copyright © 2019 MohAwad. All rights reserved.
//

import Foundation
import UIKit
import TTGSnackbar

extension UITextField {
    
    func setIcon(_ image: UIImage) {
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: 20, y: 0, width: 50, height: 50))
        
        let yAxis = (iconContainerView.frame.height / 2) - 15
        let xAxis = (iconContainerView.frame.width / 2) - 15
        
        let iconView = UIImageView(frame:
            CGRect(x: xAxis, y: yAxis, width: 30, height: 30))
        iconView.contentMode = .scaleAspectFit
        iconView.image = image
        
        iconContainerView.backgroundColor = #colorLiteral(red: 0.03137254902, green: 0.4941176471, blue: 0.5450980392, alpha: 1)
        iconContainerView.addSubview(iconView)
        rightView = iconContainerView
        rightViewMode = .always
    }
}

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setStatusBarBackgroundColor(color: UIColor) {
        
        guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else { return }
        
        statusBar.backgroundColor = color
    }
    
    func textFieldAttributes(textField: UITextField, placeholder: String) {
        let attributes = [
            NSAttributedString.Key.font : UIFont(name: "GESSTwoLight-Light", size: 18)!
        ]
        
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes:attributes)
        
        textField.layer.cornerRadius = 20
        textField.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textField.layer.borderWidth = 1
        textField.layer.masksToBounds = true
        textField.textAlignment = NSTextAlignment.center
    }
    
    func isEmpty(text: String) -> Bool {
        if text.isEmpty {
            return true
        }
        
        if text == "" {
            return true
        }
        
        if text.count == 0 {
            return true
        }
        
        return false
    }
    
    func showMessage(message:String, isError: Bool = true){
        let snackbar = TTGSnackbar(message: message, duration: .middle)
        snackbar.messageTextFont = UIFont(name: "GESSTwoLight-Light", size: 18)!
        
        if isError{
            snackbar.actionTextColor = UIColor.white
            snackbar.backgroundColor = UIColor.red
        }else{
            snackbar.actionTextColor = UIColor.white
            snackbar.messageTextColor = UIColor.white
            snackbar.backgroundColor = #colorLiteral(red: 0.01568627451, green: 0.7411764706, blue: 0.1960784314, alpha: 1)
        }
        snackbar.show()
    }
    
}

extension UIImage {
    var scaledToSafeUploadSize: UIImage? {
        let maxImageSideLength: CGFloat = 480
        
        let largerSide: CGFloat = max(size.width, size.height)
        let ratioScale: CGFloat = largerSide > maxImageSideLength ? largerSide / maxImageSideLength : 1
        let newImageSize = CGSize(width: size.width / ratioScale, height: size.height / ratioScale)
        
        return image(scaledTo: newImageSize)
    }
    
    func image(scaledTo size: CGSize) -> UIImage? {
        defer {
            UIGraphicsEndImageContext()
        }
        
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        draw(in: CGRect(origin: .zero, size: size))
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
