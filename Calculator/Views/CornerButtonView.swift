//
//  CornerButtonView.swift
//  Calculator
//
//  Created by Luis Mesquita on 16/03/2020.
//  Copyright © 2020 Luis Mesquita. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableButton: UIButton {
}


extension UIView {
	@IBInspectable
	var cornerRadius: CGFloat {
		get {
			return layer.cornerRadius
		}
		set {
			layer.cornerRadius = newValue
		}
	}
}

