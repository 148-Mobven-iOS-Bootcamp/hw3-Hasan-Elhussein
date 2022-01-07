//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Semih Emre ÜNLÜ on 26.12.2021.
//

import Foundation

class CalculatorBrain {
    
    // Accumulator variable
    private var accumulator: Double = 0
    
    // Enum for the type of operation
    private enum Operation {
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
        case C
    }
    
    // Operations dictionary
    private var operations: Dictionary<String, Operation> = [
        "√": Operation.UnaryOperation(sqrt),
        "+": Operation.BinaryOperation({ $0 + $1 }),
        "-": Operation.BinaryOperation({ $0 - $1 }),
        "*": Operation.BinaryOperation({ $0 * $1 }),
        "/": Operation.BinaryOperation({ $0 / $1 }),
        "=": Operation.Equals,
        "C": Operation.C
    ]
    
    // Function to perform the selected operation
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
        case .C:
            executePendingBinaryOperation()
            accumulator = 0
        }
    }
    
    // pending variable
    private var pending: PendingBinaryOperationInfo?
    
    // Structure for the pending binary operation info
    private struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    // Function for Equals operation
    func executePendingBinaryOperation() {
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    
    // Get result value
    var result: Double {
        get {
            return accumulator
        }
    }
    
    // Set operand value
    func setOperand(_ value: Double) {
        accumulator = value
    }
    
    
}
