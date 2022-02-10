//
//  File.swift
//  
//
//  Created by Joshua Grant on 1/21/22.
//

import Foundation

internal class TableSelectionCommand: Command
{
    internal var section: Int?
    internal var row: Int?
    internal var action: String?
    
    internal init?(command: Command)
    {
        super.init(rawString: command.rawString)
        
        let sectionRowRange = command.rawString.range(
            of: #"[0-9]+\.[0-9]+"#,
            options: .regularExpression)
        
        let rowRange = command.rawString.range(of: #"[0-9]+"#, options: .regularExpression)
        
        let commandRange = command.rawString.range(
            of: #"[A-Za-z]+"#,
            options: .regularExpression)
        
        if let range = sectionRowRange
        {
            let number = command.rawString[range]
            let numbers = number.split(separator: ".")
            section = Int(String(numbers.first ?? ""))
            row = Int(String(numbers.last ?? ""))
        }
        else if let range = rowRange
        {
            let number = command.rawString[range]
            row = Int(String(number))
        }
        else
        {
            return nil
        }
        
        if let range = commandRange
        {
            action = String(command.rawString[range])
        }
    }
}
