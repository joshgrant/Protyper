//
//  InterfaceElement.swift
//  Protyper
//
//  Created by Joshua Grant on 1/20/22.
//

import Foundation

public protocol InterfaceElement
{
    func handle(event: Event)
    func display()
}
