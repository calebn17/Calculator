//
//  OperationManager.swift
//  Calculator
//
//  Created by Caleb Ngai on 3/8/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

class OperationManager {
    
    func executeOperation(num1: Double, num2: Double, _ operation: String)-> Double {
                
        switch operation {
        case "+":
            return num1 + num2
            
        case "-":
            return num1 - num2

        case "×":
            return num1 * num2
        case "÷":
            return num1 / num2
        default:
            return 0
        }
    }

}
