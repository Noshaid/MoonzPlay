//
//  Utilis.swift
//  MoonzPlay
//
//  Created by Noshaid Ali on 01/09/2024.
//

import UIKit

@IBDesignable class NAButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateCornerRadius()
    }

    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }

    func updateCornerRadius() {
        layer.cornerRadius = rounded ? frame.size.height / 2 : 0
    }
}

extension UIColor {
    static let backgroundColor = UIColor(red: 26/255.0, green: 26/255.0, blue: 28/255.0, alpha: 1.0);
    static let greyTextColor = UIColor(red: 181/255.0, green: 183/255.0, blue: 189/255.0, alpha: 1.0);
}
