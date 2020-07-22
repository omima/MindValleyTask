//
//  UIView+xibSetup.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/22/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    @objc func xibSetup() {
        if let contentView = loadViewFromNib() {
            contentView.frame = bounds
            contentView.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
            addSubview(contentView)
        }
    }
    
    @objc func loadViewFromNib() -> UIView! {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
}
