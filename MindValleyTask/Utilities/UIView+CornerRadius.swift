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
