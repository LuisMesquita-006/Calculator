//
//  Formatter+Extensions.swift
//  Calculator
//
//  Created by Luis Mesquita on 18/03/2020.
//  Copyright © 2020 Luis Mesquita. All rights reserved.
//

import Foundation

extension Formatter {
	static let withSeparator: NumberFormatter = {
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		formatter.generatesDecimalNumbers = true
//		formatter.groupingSeparator = " "
		formatter.usesGroupingSeparator = true
		formatter.locale = .current
//		formatter.locale = Locale(identifier: "pt_PT")
//		formatter.decimalSeparator = "."
		return formatter
	}()
}
