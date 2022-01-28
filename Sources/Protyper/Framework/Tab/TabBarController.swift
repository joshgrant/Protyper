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
        super.init(title: nil)
        
        for tab in tabs
        {
            tab.tabController = self
        }
    }
    
    open override func loadView()
    {
        view = View()
        addActiveTabToViewHierarchy()
    }
    
    // MARK: - Functions
    
    public func select(tab: ViewController)
    {
        removeActiveTabFromViewHierarchy()
        
        let index = tabs.firstIndex { $0 == tab }
        selectedIndex = index ?? 0

        addActiveTabToViewHierarchy()
    }
    
    func addActiveTabToViewHierarchy()
    {
        guard let activeTabView = activeTab.view else { return }
        
        addChild(activeTab)
        view?.insertSubview(activeTabView, at: 0)
        activeTab.didMove(toParent: self)
    }
    
    func removeActiveTabFromViewHierarchy()
    {
        activeTab.willMove(toParent: nil)
        activeTab.view?.removeFromSuperview()
        activeTab.removeFromParent()
    }
}
