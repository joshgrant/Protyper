//
//  Controller.swift
//  Protyper
//
//  Created by Joshua Grant on 1/17/22.
//

import Foundation

open class ViewController: Identifiable
{
    public var id = UUID()
    
    public var title: String? = nil
    
    public var navigationItem: NavigationItem?
    public var navigationController: NavigationController?
    
    public var tabBarItem: TabBarItem?
    public var tabController: TabBarController?
    
    /// The view controller that is being presented by this controller
    public var presentedViewController: ViewController?
    /// The view controller that is presenting this controller
    public var presentingViewController: ViewController?
    
    /// If view is `nil`, make sure to override the `display` function in your view controller
    public var view: View?
    
    public init(title: String? = nil, view: View? = nil)
    {
        self.title = title
        self.view = view
        
        self.navigationItem = .init(title: title ?? "")
        self.tabBarItem = .init(title: title ?? "")
    }

    open func handle(command: Command)
    {
        if let presentedViewController = presentedViewController
        {
            presentedViewController.handle(command: command)
            return
        }
        
        view?.handle(command: command)
    }
    
    // TODO: Should have to call super.display()... or something else because presented
    // view controllers aren't showing properly...
    open func display()
    {
        if let presentedViewController = presentedViewController {
            presentedViewController.display()
            return
        }
        
        guard let view = view else
        {
            assertionFailure("Please use a custom view or override `display` in your view controller")
            return
        }
        
        print(view.content, terminator: "")
    }
    
    open func present(controller: ViewController)
    {
        guard presentedViewController == nil else { fatalError("Already presenting a view controller") }
        self.presentedViewController = controller
        controller.presentingViewController = self
    }
    
    open func dismiss()
    {
        guard let presentingViewController = presentingViewController else
        {
            navigationController?.dismiss()
            return
        }

        presentingViewController.presentedViewController = nil
        self.presentingViewController = nil
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
