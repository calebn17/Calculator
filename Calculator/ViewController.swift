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
    var storeNums: [Double] = []
    var i = 0
    var operationKey: String = ""
    var result = 0.00
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        if i == 1 {
            storeNums.append(Double(displayLabel.text!)!)
            result = operationManager.executeOperation(storeNums, operationKey)
            displayLabel.text = String(result.clean)
            storeNums = []
            i = 0
        }
        
        storeNums.append(Double(displayLabel.text!)!)
        print("\(storeNums)  i = \(i)")
        
        switch sender.currentTitle {
        case "+":
            operationKey = "+"
            i += 1
        case "-":
            operationKey = "-"
            i += 1
        case "×":
            operationKey = "×"
            i += 1
        case "÷":
            operationKey = "÷"
            i += 1
        case "+/-":
            storeNums[i] *= -1
            displayLabel.text = "\(storeNums[i].clean)"
        case "%":
            storeNums[i] /= 100.00
            displayLabel.text = "\(storeNums[i].clean)"
        case "=":
            displayLabel.text = String(result.clean)
        case "AC":
            storeNums = []
            displayLabel.text = "0"
        default:
            displayLabel.text = "error"
        }
    }
    
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber{
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else{
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
    }

}

extension Double {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }

}

