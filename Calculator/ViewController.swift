//
//  ViewController.swift
//  Calculator
//
//  Created by Luis Mesquita on 15/03/2020.
//  Copyright © 2020 Luis Mesquita. All rights reserved.
//

import UIKit

let calculator = Calculator()
var temp: Double?

class ViewController: UIViewController {
	
	@IBOutlet weak var formulaTxtFld: UITextField!
	@IBOutlet weak var resultBtnFld: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		formulaTxtFld.text = "0"
		resultBtnFld.setTitle("0", for: .disabled)
	}
	
	@IBAction func getNumberButtonPressed(_ sender:UIButton) {
		calculator.tempNumber += sender.currentTitle!
		if calculator.formula == "0" {
			calculator.formula = calculator.tempNumber
		} else {
			calculator.formula += sender.currentTitle!
		}
		resultBtnFld.setTitle(display(number:calculator.tempNumber), for: .disabled)
		formulaTxtFld.text = display(number:calculator.formula)
	}
	
	@IBAction func getOperatorPressed(_ sender: UIButton) {
		calculator.formula += sender.currentTitle!
//		calculator.operatorExistent = true
		calculator.operationChoosen(value: sender.currentTitle!)
		
		if calculator.displayNumber == "0" || calculator.displayNumber == "" {
			resultBtnFld.setTitle(display(number:calculator.tempNumber), for: .disabled)
		} else {
			resultBtnFld.setTitle(display(number:calculator.displayNumber), for: .disabled)
		}
		formulaTxtFld.text = calculator.formula
	}
	
	@IBAction func equalButtonPressed(_ sender: UIButton) {
		calculator.numbersAndResult()
//		calculator.calculate()
		resultBtnFld.setTitle(display(number:calculator.displayNumber), for: .disabled)
	}
	
	@IBAction func clearAllButtonPressed(_ sender: UIButton) {
		calculator.clearAll()
		resultBtnFld.setTitle("0", for: .disabled)
		formulaTxtFld.text = "0"
	}
	
	@IBAction func clearButtonPressed(_ sender: UIButton) {
		calculator.clear()
		resultBtnFld.setTitle(display(number:calculator.displayNumber), for: .disabled)
		formulaTxtFld.text = calculator.formula
	}
	
	@IBAction func percentageButtonPressed(_ sender: UIButton) {
		calculator.formula += sender.currentTitle!
		calculator.percentage()
		resultBtnFld.setTitle(display(number:calculator.displayNumber), for: .disabled)
		formulaTxtFld.text = calculator.formula
	}
	
	func display(number: String) -> String {
		if let temp = Double(number) {
			return String(temp.formattedWithSeparator)
		} else {
			return number
		}
	}
	
	
}


