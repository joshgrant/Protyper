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
    
    public func activeTab() -> ViewController
    {
        return tabs[selectedIndex]
    }
    
    override public func display()
    {
        activeTab().display()
        tabBar.display()
    }
    
    override public func handle(event: Event)
    {
        switch event.rawString
        {
        case "dashboard":
            selectedIndex = 0
        case "library":
            selectedIndex = 1
        default:
            activeTab().handle(event: event)
        }
    }
}
