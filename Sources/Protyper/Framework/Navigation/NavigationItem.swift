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
    public var rightItem: String?
    
    public init(title: String, rightItem: String? = nil)
    {
        self.title = title
        self.rightItem = rightItem
    }
}

extension NavigationItem: CustomStringConvertible
{
    public var description: String
    {
        let right = "\(rightItem ?? "")"
        return "\(title)\(right)"
    }
}

extension NavigationItem
{
    static let back = NavigationItem(title: "<")
}
