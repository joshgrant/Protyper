//
//  Created by Josh Grant on 1/27/22.
//

import Foundation

public extension String
{
    static func *(lhs: String, rhs: Int) -> String
    {
        var output: String = ""
        for _ in 0 ..< rhs
        {
            output += lhs
        }
        return output
    }
    
    static var newline: String { "\n" }
    static var divider: String { "–" * consoleWidth }
    
    /// Returns the center padding (spaces) that makes the right-most character of the right string
    /// aligned with the width.
    static func centerPadding(left: String, right: String, width: Int) -> String
    {
        let leftCount = left.count
        let rightCount = right.count
        
        let remainingSpace = width - (leftCount + rightCount)
        return " " * remainingSpace
    }
    
    static func maximumPadding(elements: [String], width: Int, padLeft: Bool = false) -> String
    {
        // Add a leftmost element in order to have left padding
        let elements = padLeft ? [""] + elements : elements
        var elementWidth: Int = 0
        for element in elements
        {
            elementWidth += element.count
        }
        
        let totalPadding = width - elementWidth
        
        let singlePadding: Int = totalPadding / elements.count
        
        // The padding can be evenly distributed
        let evenlyDistributed = totalPadding % elements.count == 0
        
        var output: String = ""
        
        for pair in elements.enumerated()
        {
            output += pair.element
            output += " " * singlePadding
            
            if pair.offset == 0 && !evenlyDistributed
            {
                output += " "
            }
        }
        
        return output
    }
}
