//
//  Event.swift
//  Protyper
//
//  Created by Joshua Grant on 1/17/22.
//

import Foundation

open class TabBar: View
{
    private var items: [TabBarItem]
    
    public init(items: [TabBarItem])
    {
        self.items = items
    }
    
    open override func draw()
    {
        var output = ""
        output += .divider
        output += .newline
        
        output += String.maximumPadding(elements: items.map { $0.description }, width: consoleWidth, padLeft: true)
        output += .newline
        
        output += .divider
        output += .newline
        
        print(output, terminator: "")
    }
}
