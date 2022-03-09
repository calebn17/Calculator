//
//  OperationManager.swift
//  Calculator
//
//  Created by Caleb Ngai on 3/8/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

class OperationManager {
    
    func executeOperation(_ numsArray: [Double], _ operation: String)-> Double {
        let lastNum = numsArray.count - 1
        
        switch operation {
        case "+":
            return numsArray[0] + numsArray[lastNum]
            
        case "-":
            return numsArray[0] - numsArray[lastNum]

        case "×":
            return numsArray[0] * numsArray[lastNum]
        case "÷":
            return numsArray[0] / numsArray[lastNum]
        default:
            return 0
        }
    }

}
