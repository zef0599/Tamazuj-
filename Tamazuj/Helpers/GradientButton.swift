


import UIKit

@IBDesignable
class GradientButton: UIButton {
    let gradientLayer = CAGradientLayer()
    
    @IBInspectable
    var topGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    @IBInspectable
    var bottomGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    

    
    //    private func setGradientJo(topGradientColor: UIColor?, bottomGradientColor: UIColor?){
//            if let topGradientColor = topGradientColor, let bottomGradientColor = bottomGradientColor {
//
//                let gradientColors: [CGColor] = [topGradientColor.cgColor, bottomGradientColor.cgColor]
//                let gradientLocations: [Float] = [0.0, 0.5]
//                let gradientLayer: CAGradientLayer = CAGradientLayer()
//
//                gradientLayer.colors = gradientColors
//                gradientLayer.locations = gradientLocations as [NSNumber]?
//
//                gradientLayer.frame = self.bounds
//                self.layer.insertSublayer(gradientLayer, at: 0)
//
//                    }
//
//
//    }
    
    
    private func setGradient(topGradientColor: UIColor?, bottomGradientColor: UIColor?) {
        if let topGradientColor = topGradientColor, let bottomGradientColor = bottomGradientColor {
            gradientLayer.frame = self.bounds
            gradientLayer.colors = [topGradientColor.cgColor, bottomGradientColor.cgColor]
            gradientLayer.borderColor = layer.borderColor
            gradientLayer.borderWidth = layer.borderWidth
            gradientLayer.cornerRadius = layer.cornerRadius
            layer.insertSublayer(gradientLayer, at: 0)
        } else {
            gradientLayer.removeFromSuperlayer()
        }
    }
}
