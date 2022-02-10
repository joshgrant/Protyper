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
    
    public var navigationBar: NavigationBar
    public var stack: [ViewController]
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
        super.init(title: nil)
        root.navigationController = self
        updateItems()
    }
    
    public func updateItems()
    {
        navigationBar.items = []
        
        if stack.count > 1
        {
            navigationBar.items += [.back]
        }
        
        if let item = activeController.navigationItem
        {
            navigationBar.items += [item]
        }
    }
    
    // MARK: - Functions
    
    open override func loadView()
    {
        view = View()
        view?.addSubview(navigationBar)
        addNavigationControllerToViewHierarchy()
    }
    
    open override func viewWillAppear()
    {
        super.viewWillAppear()
        updateItems()
    }
    
    override public func handle(command: Command)
    {
        switch command.rawString
        {
        case "back":
            _ = pop()
        default:
            activeController.handle(command: command)
        }
    }
    
    /// Adds a controller to the top of the stack and gives it control
    public func push(controller: ViewController)
    {
        removeNavigationControllerFromViewHierarchy()
        
        stack.append(controller)
        activeController = controller
        activeController.navigationController = self
        
        addNavigationControllerToViewHierarchy()
        
        updateItems()
    }
    
    /// Removes the top-most controller from the stack and passes
    /// control to the previous controller
    public func pop() -> ViewController?
    {
        defer
        {
            updateItems()
        }
        
        guard stack.count > 1 else { return nil }
        
        removeNavigationControllerFromViewHierarchy()
        let removed = stack.popLast()
        removed?.navigationController = nil
        
        if let last = stack.last
        {
            activeController = last
            addNavigationControllerToViewHierarchy()
        }
        
        updateItems()
        
        return removed
    }
}

// MARK: - Container

extension NavigationController
{
    func addNavigationControllerToViewHierarchy()
    {
        guard let navigationView = activeController.view else { return }
        addChild(activeController)
        view?.insertSubview(navigationView, at: 1)
        activeController.didMove(toParent: self)
    }
    
    func removeNavigationControllerFromViewHierarchy()
    {
        activeController.willMove(toParent: nil)
        activeController.view?.removeFromSuperview()
        activeController.removeFromParent()
    }
}
