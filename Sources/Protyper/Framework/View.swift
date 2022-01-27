//
//  View.swift
//  Protyper
//
//  Created by Joshua Grant on 1/20/22.
//

import Foundation

open class View: InterfaceElement
{
    public init()
    {
        
    }
    
    open var content: String
    {
        return ""
    }
    
    open func draw()
    {
        print(content)
    }
    
    open func handle(command: Command)
    {
        
    }
}
