//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Semih Emre ÜNLÜ on 26.12.2021.
//

import Foundation

class CalculatorBrain {
    //istenen işlemler + - * / bonus C CE =
    //standford university ios 9 > youtube video 1 ya da 2
    private var accumulator: Double = 0
    
    enum Operation {
        case UnaryOperation((Double) -> Double)
        case BinaryOperation
        case Equals
    }
    
    var operations: Dictionary<String, Operation> = [
        "√": Operation.UnaryOperation(sqrt)
    ]

    func performOperation(_ symbol: String) {
        guard let operation = operations[symbol] else { return }

        switch operation {
        case .UnaryOperation(let function): accumulator = function(accumulator)
        case .Equals:
            break
        default:
            break
        }
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }

    func setOperand(_ value: Double) {
        accumulator = value
    }
}
