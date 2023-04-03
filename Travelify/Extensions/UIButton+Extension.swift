//
//  UIButton+Extension.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import UIKit

extension UIButton {
    func underline() {
        if let textString = self.titleLabel?.text {

            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                          value: NSUnderlineStyle.single.rawValue,
                                          range: NSRange(location: 0, length: textString.count))
            self.setAttributedTitle(attributedString, for: .normal)
        }
    }
}

extension UIButton {
    func addCorner() {
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
    }
}


