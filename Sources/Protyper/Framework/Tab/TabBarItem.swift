//
//  TabBarItem.swift
//  Protyper
//
//  Created by Joshua Grant on 1/20/22.
//

import Foundation

open class TabBarItem
{
    public var title: String
    
    public init(title: String)
    {
        self.title = title
    }
}

extension TabBarItem: CustomStringConvertible
{
    public var description: String { title }
}
