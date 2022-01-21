//
//  NavigationItem.swift
//  Protyper
//
//  Created by Joshua Grant on 1/20/22.
//

import Foundation

open class NavigationItem
{
    public var title: String
    
    public init(title: String)
    {
        self.title = title
    }
}

extension NavigationItem: CustomStringConvertible
{
    public var description: String { title }
}
