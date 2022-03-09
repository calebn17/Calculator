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
        arithmeticOperation(senderTitle: sender.currentTitle!)
    }
    
//MARK: - IBAction Modifier
    @IBAction func modifierPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        modifierOperation(senderTitle: sender.currentTitle!)
    }
    
//MARK: - Methods
        
    func calculation () {
        num2 = Double(displayLabel.text!)!
        result = operationManager.executeOperation(num1: num1, num2: num2, operationKey)
        displayLabel.text = result.clean
        num1 = result
        num2 = 0.00
    }
    
    func arithmeticOperation(senderTitle: String) {
        if senderTitle == "="{
            calculation()
            operationIsDone = true
        } else if senderTitle == "AC"{
            result = 0.00
            num1 = 0.00
            num2 = 0.00
            decimalPointCount = 0
            displayLabel.text = "0"
        } else {
            if num1 == 0.00{
                num1 = Double(displayLabel.text!)!
                operationKey = senderTitle
            } else if operationIsDone{
                operationKey = senderTitle
                operationIsDone = false
            }
            else{
                calculation()
                operationKey = senderTitle
            }
        }
    }
    
    func modifierOperation(senderTitle: String) {
        var calc: Double = 1.00
        if senderTitle == "+/-" {calc = -1.00}
        else {calc = 0.01}
        
        if num1 == 0.00 {
            num1 = Double(displayLabel.text!)!
            num1 *= calc
            operationIsDone = true
            displayLabel.text = "\(num1.clean)"
        }else {
            num2 = Double(displayLabel.text!)!
            num2 *= calc
            operationIsDone = true
            displayLabel.text = "\(num2.clean)"
        }
       
    }
//MARK: - IBAction Number Buttons
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber{
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else{
                
                if sender.currentTitle == "." && decimalPointCount < 1{
                    decimalPointCount = 1
                }else if sender.currentTitle == "." && decimalPointCount == 1 {
                    print("too many decimals")
                    return
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}

//MARK: - Double Extension
extension Double {
    
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }

}

//testing branching
//testing from a different machine (MBP)

