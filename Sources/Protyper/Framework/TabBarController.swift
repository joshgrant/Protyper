//
//  TabBarController.swift
//  Protyper
//
//  Created by Joshua Grant on 1/17/22.
//

import Foundation

open class TabBarController: ViewController
{
    // MARK: - Variables
    
    public let tabs: [ViewController]
    public var tabBar: TabBar
    public var selectedIndex: Int
    
    public var activeTab: ViewController
    {
        return tabs[selectedIndex]
    }
    
    // MARK: - Initialization
    
    public init(tabs: [ViewController])
    {
        precondition(!tabs.isEmpty)
        self.tabs = tabs
        selectedIndex = 0
        
        let items = tabs.map {
            $0.tabBarItem ?? TabBarItem(title: "_____")
        }
        
        self.tabBar = TabBar(items: items)
        super.init(title: nil, view: View())
        
        for tab in tabs
        {
            tab.tabController = self
        }
    }
    
    // MARK: - Functions
    
    public func select(tab: ViewController)
    {
        let index = tabs.firstIndex { $0 == tab }
        selectedIndex = index ?? 0
    }
    
    override public func display()
    {
        activeTab.display()
        print(tabBar.content)
    }
}
