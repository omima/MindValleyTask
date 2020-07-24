//
//  UIView+CornerRadius.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/22/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius}
        set {
            layer.cornerRadius =  newValue
            layer.masksToBounds = newValue > 0
        }
    }
}


extension String {
    func height(withWidth width: CGFloat, font: UIFont) -> CGFloat {
         let maxSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let actualSize = self.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font : font], context: nil)
         return actualSize.height
     }
     

}

extension UIFont {
    static func robotoRegular(size: CGFloat) -> UIFont? {
        return UIFont(name: "Roboto-Regular", size: size)
    }
    
    static func robotoSemiBold(size: CGFloat) -> UIFont? {
        return UIFont(name: "Roboto-Medium", size: size)
    }
    
    static func robotoBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Bold", size: size)!
    }
}
