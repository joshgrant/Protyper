//
//  InterfaceElement.swift
//  Protyper
//
//  Created by Joshua Grant on 1/20/22.
//

import Foundation

public protocol InterfaceElement
{
    var content: String { get }
    
    func draw()
    func handle(command: Command)
}
