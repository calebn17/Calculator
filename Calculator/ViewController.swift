//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    let operationManager = OperationManager()
    
    var isFinishedTypingNumber: Bool = true
    var operationIsDone: Bool = false
    var decimalPointCount = 0
    var operationKey: String = ""
    var num1 = 0.00
    var num2 = 0.00
    var result = 0.00
    
//MARK: - IBActions Arithmetic
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        decimalPointCount = 0
        
        switch sender.currentTitle {
        case "+":
            if num1 == 0.00{
                num1 = Double(displayLabel.text!)!
                operationKey = "+"
            } else if operationIsDone{
                operationKey = "+"
                operationIsDone = false
            }
            else{
                calculation()
                operationKey = "+"
            }
        case "-":
            if num1 == 0.00{
                num1 = Double(displayLabel.text!)!
                operationKey = "-"
            }
            else if operationIsDone{
                operationKey = "-"
                operationIsDone = false
            }else {
                calculation()
                operationKey = "-"
            }
        case "×":
            if num1 == 0.00{
                num1 = Double(displayLabel.text!)!
                operationKey = "×"
            } else if operationIsDone{
                operationKey = "×"
                operationIsDone = false
            }else {
                calculation()
                operationKey = "×"
            }
        case "÷":
            if num1 == 0.00{
                num1 = Double(displayLabel.text!)!
                operationKey = "÷"
            } else if operationIsDone{
                operationKey = "÷"
                operationIsDone = false
            } else {
                calculation()
                operationKey = "÷"
            }
        case "=":
            calculation()
            operationIsDone = true
        case "AC":
            result = 0.00
            num1 = 0.00
            num2 = 0.00
            decimalPointCount = 0
            displayLabel.text = "0"
            
        default:
            displayLabel.text = "error"
        }
    }
//MARK: - IBAction Modifier
    @IBAction func modifierPressed(_ sender: UIButton) {

        isFinishedTypingNumber = true
        
        
        switch sender.currentTitle {
            case "+/-":
                if num1 == 0.00 {
                    num1 = Double(displayLabel.text!)!
                    num1 *= -1
                    operationIsDone = true
                    displayLabel.text = "\(num1.clean)"
                }else {
                    num2 = Double(displayLabel.text!)!
                    num2 *= -1
                    operationIsDone = true
                    displayLabel.text = "\(num2.clean)"
                }
            default:
                if num1 == 0.00 {
                    num1 = Double(displayLabel.text!)!
                    num1 /= 100.00
                    operationIsDone = true
                    displayLabel.text = "\(num1.clean)"
                }else {
                    num2 = Double(displayLabel.text!)!
                    num2 /= 100.00
                    operationIsDone = true
                    displayLabel.text = "\(num2.clean)"
                }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber{
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else{
                
                if sender.currentTitle == "." && decimalPointCount < 1{
                    decimalPointCount = 1
                    print(decimalPointCount)
                }else if sender.currentTitle == "." && decimalPointCount == 1 {
                    print("too many decimals")
                    return
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }

//MARK: - Methods
    func calculation () {
        num2 = Double(displayLabel.text!)!
        result = operationManager.executeOperation(num1: num1, num2: num2, operationKey)
        displayLabel.text = result.clean
        num1 = result
        num2 = 0.00
        
    }


}

//MARK: - Double Extension
extension Double {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }

}

