//
//  NavigationController.swift
//  Protyper
//
//  Created by Joshua Grant on 1/17/22.
//

import Foundation

open class NavigationController: ViewController
{
    // MARK: - Variables
    
    public var stack: [ViewController]
    public var navigationBar: NavigationBar
    public var activeController: ViewController
    
    override public var tabBarItem: TabBarItem? {
        get { stack.first?.tabBarItem }
        set { }
    }
    
    override public var navigationItem: NavigationItem? {
        get { activeController.navigationItem }
        set { }
    }
    
    // MARK: - Initialization
    
    public init(root: ViewController)
    {
        self.stack = [root]
        self.activeController = root
        self.navigationBar = NavigationBar(items: [])
        super.init(title: nil, view: View())
        root.navigationController = self
        updateItems()
    }
    
    public func updateItems()
    {
        var items: [NavigationItem] = []
        if let item = activeController.navigationItem
        {
            items += [item]
        }
        self.navigationBar = NavigationBar(items: items)
    }
    
    // MARK: - Functions
    
    override public func display()
    {
        navigationBar.display()
        activeController.display()
    }
    
    override public func handle(event: Event)
    {
        switch event.rawString
        {
        case "back":
            _ = pop()
        default:
            activeController.handle(event: event)
        }
    }
    
    /// Adds a controller to the top of the stack and gives it control
    public func push(controller: ViewController)
    {
        stack.append(controller)
        activeController = controller
        activeController.navigationController = self
        
        updateItems()
    }
    
    /// Removes the top-most controller from the stack and passes
    /// control to the previous controller
    public func pop() -> ViewController?
    {
        guard stack.count > 1 else { return nil }
        let removed = stack.popLast()
        removed?.navigationController = nil
        if let last = stack.last
        {
            activeController = last
        }
        
        updateItems()
        
        return removed
    }
}