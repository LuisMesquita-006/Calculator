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
		formatter.groupingSeparator = " "
		formatter.numberStyle = .decimal
		formatter.locale = .current
		return formatter
	}()
}
