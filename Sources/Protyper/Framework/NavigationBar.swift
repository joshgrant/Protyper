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
    
    override public func display()
    {
        print("")
        print("")
        print("")
        print("")
        print("")
        for item in items {
            print(item, terminator: "")
        }
        print("")
        print("––––––––––––––––––––")
    }
}
