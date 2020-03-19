//
//  Double+Extensions.swift
//  Calculator
//
//  Created by Luis Mesquita on 18/03/2020.
//  Copyright © 2020 Luis Mesquita. All rights reserved.
//

import Foundation

extension Double{
	var formattedWithSeparator: String {
		return Formatter.withSeparator.string(for: self) ?? ""
	}
}
