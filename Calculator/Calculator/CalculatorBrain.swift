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
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    var operations: Dictionary<String, Operation> = [
        "√": Operation.UnaryOperation(sqrt),
        "+": Operation.BinaryOperation(add),
        "-": Operation.BinaryOperation(sub),
        "*": Operation.BinaryOperation(multiply),
        "/": Operation.BinaryOperation(divide),
        "=": Operation.Equals
    ]

    func performOperation(_ symbol: String) {
        guard let operation = operations[symbol] else { return }

        switch operation {
        case .UnaryOperation(let function):
            accumulator = function(accumulator)
        case .BinaryOperation(let function):
            executePendingBinaryOperation()
            pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
        case .Equals:
            executePendingBinaryOperation()
            
        }
    }
    
    private var pending: PendingBinaryOperationInfo?
    
    struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    func executePendingBinaryOperation() {
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
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


// MARK: - Math Functions

func add(num1: Double, num2: Double) -> Double {
    return num1 + num2
}

func sub(num1: Double, num2: Double) -> Double {
    return num1 - num2
}

func multiply(num1: Double, num2: Double) -> Double {
    return num1 * num2
}

func divide(num1: Double, num2: Double) -> Double {
    return num1 / num2
}
