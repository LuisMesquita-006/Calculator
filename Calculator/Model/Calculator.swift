//
//  Calculator.swift
//  Calculator
//
//  Created by Luis Mesquita on 16/03/2020.
//  Copyright © 2020 Luis Mesquita. All rights reserved.
//

import Foundation

enum OperationType: String {
	case divide = "÷"
	case multiply = "x"
	case subtract = "-"
	case add = "+"
	case percentage = "%"
	case clear = "AC"
	case clearAll = "C"
	case result = "="
}

class Calculator {
	var number1: String = ""
	var number2: String = ""
	var tempNumber: String = ""
	var result: String = ""
	var resultNumber: Double = 0
	var formula: String = "0"
	var operation: OperationType?
	var operatorExistent: Bool = false
	var displayNumber: String = ""
	var percentageON: Bool = false
	
	func operationChoosen(value: String) {
		if operation != nil {
			numbersAndResult()
		}
		let operatorValue = OperationType(rawValue: value)
		switch operatorValue {
			case .divide:
				operation = .divide
			case .multiply:
				operation = .multiply
			case .subtract:
				operation = .subtract
			case .add:
				operation = .add
			case .percentage:
				operation = .percentage
			default:
				return
		}
		numbersAndResult()
	}
	
	func numbersAndResult() {
		guard tempNumber != "" else {return}
		if number1 == "" {
			number1 = tempNumber
			result = number1
			displayNumber = number1
			tempNumber = ""
			number2 = ""
		} else if operatorExistent {
			number2 = ""
			operatorExistent = false
			tempNumber = ""
		} else {
			number2 = tempNumber
			tempNumber = ""
			displayNumber = number2
			result = ""
			if percentageON {
				return
			} 
			calculate()
		}
	}
			
	func calculate() {
		guard let fNum = Double(number1), let sNum = Double(number2) else { return }
		switch operation {
			case .divide:
				result = (fNum / sNum).formattedWithSeparator
				resultNumber = fNum / sNum
			case .multiply:
				result = (fNum * sNum).formattedWithSeparator
				resultNumber = fNum * sNum
			case .subtract:
				result = (fNum - sNum).formattedWithSeparator
				resultNumber = fNum - sNum
			case .add:
				result = (fNum + sNum).formattedWithSeparator
				resultNumber = fNum + sNum
			default:
				return
		}
		number1 = result
		tempNumber = result
		if resultNumber.truncatingRemainder(dividingBy: 1) != 0 {
			displayNumber = result
		} else {
			displayNumber = String(resultNumber.formattedWithSeparator)
		}
		number2 = ""
		operation = nil
		operatorExistent = true
	}
	
	func clearAll() {
		tempNumber = ""
		number1 = ""
		number2 = ""
		result = ""
		formula = "0"
		displayNumber = "0"
		operation = nil
		operatorExistent = false
	}
	
	func clear() {
		if tempNumber != "" && operation != nil {
			if tempNumber.count > 0 {
				let range = formula.index(formula.endIndex, offsetBy: -(tempNumber.count+1))..<formula.endIndex
				formula.removeSubrange(range)
			}
			number2 = ""
			displayNumber = result
			tempNumber = ""
			operation = nil
		}
		displayNumber = result
		tempNumber = ""
	}
	
	func percentage() {
		percentageON = true
		numbersAndResult()
		guard let fNum = Double(number1) else {return}
		if let sNum = Double(number2) {
			number2 = String(fNum * sNum/(100))
			resultNumber = fNum * sNum/100
		} else {
			number1 = String(fNum/100)
			resultNumber = fNum/100
		}
		if resultNumber.truncatingRemainder(dividingBy: 1) != 0 {
			displayNumber = String(resultNumber.formattedWithSeparator)
		} else {
			displayNumber = String(resultNumber.formattedWithSeparator)
		}
		percentageON = false
	}

}
