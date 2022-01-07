//
//  DateExtension.swift
//  PrettyDate
//
//  Created by Hasan Elhussein on 7.01.2022.
//

import Foundation

extension Date {
    
    var prettyDate: String { // returns a String of prettyDate
        return configureDateFormatter(self, "dd<>MM<>yyyy")
    }
    
    var day: String { // returns a String of day
        return configureDateFormatter(self, "dd")
    }
    
    var month: String { // returns a String of month
        return configureDateFormatter(self, "MM")
    }
    
    var year: String { // returns a String of year
        return configureDateFormatter(self, "yyyy")
    }
    
}


// MARK: - Functions

// Configure dateFormatter with given format
func configureDateFormatter(_ date: Date, _ format: String) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    
    return dateFormatter.string(from: date)
}
