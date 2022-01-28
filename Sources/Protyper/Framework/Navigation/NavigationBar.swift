//
//  NavigationBar.swift
//  Protyper
//
//  Created by Joshua Grant on 1/20/22.
//

import Foundation

open class NavigationBar: View
{
    public var items: [NavigationItem]
    
    public init(items: [NavigationItem])
    {
        self.items = items
        super.init()
    }
    
    open override var content: String
    {
        var output = ""
        
        output += .newline * 5
        for item in items
        {
            output += item.description
        }
        output += .newline
        output += .divider
        output += .newline
        
        return output
    }
}
