//
//  Controller.swift
//  Protyper
//
//  Created by Joshua Grant on 1/17/22.
//

import Foundation

open class ViewController: InterfaceElement
{
    public var title: String? = nil
    
    public var navigationItem: NavigationItem?
    public var navigationController: NavigationController?
    
    public var tabBarItem: TabBarItem?
    public var tabController: TabBarController?
    
    public var view: View
    
    public init(title: String? = nil, view: View)
    {
        self.title = title
        self.view = view
        
        self.navigationItem = .init(title: title ?? "")
        self.tabBarItem = .init(title: title ?? "")
    }

    public func handle(event: Event)
    {
        view.handle(event: event)
    }
    
    public func display()
    {
        view.display()
    }
}

public extension ViewController: Identifiable { }

public extension ViewController: Equatable
{
    static func ==(lhs: ViewController, rhs: ViewController) -> Bool
    {
        return lhs.id == rhs.id
    }
}

public extension ViewController: Hashable
{
    func hash(into hasher: inout Hasher)
    {
        hasher.combine(id)
    }
}
