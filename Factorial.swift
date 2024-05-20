import Foundation

//  Factorial.swift
//
//  Created by Kent Gatera
//  Created on 2024-05-06
//  Version 1.0
//  Copyright (c) Kent Gatera. All rights reserved.
//

// Factorial class
final class Factorial {
    
    // Private constructor to prevent instantiation.
    private init() {
        fatalError("Cannot instantiate")
    }
    
    static func main() {
        let inputFile = URL(fileURLWithPath: "input.txt")
        let outputFile = URL(fileURLWithPath: "output.txt")
        
        do {
            let inputString = try String(contentsOf: inputFile, encoding: .utf8)
            let inputs = inputString.components(separatedBy: .newlines)
            var outputStrings = [String]()
            
            for inputLine in inputs {
                if let number = Int(inputLine) {
                    let factorial = RecFactorial(number)
                    outputStrings.append("\(factorial)")
                } else {
                    outputStrings.append("Must be an integer!")
                }
            }
            
            let outputString = outputStrings.joined(separator: "\n")
            try outputString.write(to: outputFile, atomically: true, encoding: .utf8)
            print("Done.")
        } catch {
            print("Error: \(error)")
        }
    }
    
    // Recursive method that gets the factorial of a number.
    private static func RecFactorial(_ n: Int) -> Int {
        if n == 0 {
            return 1
        } else {
            return n * RecFactorial(n - 1)
        }
    }
}

// Call the main method to execute
Factorial.main()
