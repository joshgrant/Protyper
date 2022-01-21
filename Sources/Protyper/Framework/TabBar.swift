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
    
    override public func display()
    {
        print("––––––––––––––––––––")
        print(items)
        print("––––––––––––––––––––")
    }
}
