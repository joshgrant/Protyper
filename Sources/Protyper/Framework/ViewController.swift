//
//  Controller.swift
//  Protyper
//
//  Created by Joshua Grant on 1/17/22.
//

import Foundation

open class ViewController: InterfaceElement, Identifiable
{
    public var id = UUID()
    
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

    open func handle(command: Command)
    {
        view.handle(command: command)
    }
    
    open func display()
    {
        view.display()
    }
}

extension ViewController: Equatable
{
    public static func ==(lhs: ViewController, rhs: ViewController) -> Bool
    {
        return lhs.id == rhs.id
    }
}

extension ViewController: Hashable
{
    public func hash(into hasher: inout Hasher)
    {
        hasher.combine(id)
    }
}
