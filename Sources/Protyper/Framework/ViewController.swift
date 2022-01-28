//
//  Controller.swift
//  Protyper
//
//  Created by Joshua Grant on 1/17/22.
//

import Foundation

/// A view controller’s main responsibilities include the following:
/// Updating the contents of the views, usually in response to changes to the underlying data.
/// Responding to user interactions with views.
/// Resizing views and managing the layout of the overall interface.
/// Coordinating with other objects—including other view controllers—in your app.
/// A view controller is tightly bound to the views it manages and takes part in handling events in its view hierarchy.
/// Specifically, view controllers are UIResponder objects and are inserted into the responder chain between the view controller’s root view and that view’s superview, which typically belongs to a different view controller.
/// If none of the view controller’s views handle an event, the view controller has the option of handling the event or passing it along to the superview.
///
/// When the visibility of its views changes, a view controller automatically calls its own methods so that subclasses can respond to the change.
open class ViewController: Responder, Identifiable
{
    public var id = UUID()
    
    /// UIViewController similarly implements the method and returns its view’s superview.
    /// TODO: Presented view controller
    override var next: Responder? {
        get { presentedViewController ?? view?.superview }
        set { super.next = newValue }
    }
    
    public var title: String? = nil
    {
        didSet
        {
            // TODO: Is this right?
            navigationItem = .init(title: title ?? "")
            tabBarItem = .init(title: title ?? "")
        }
    }
    
    /// If the recipient is a child of a container view controller, this property holds the view controller it is contained in.
    /// If the recipient has no parent, the value in this property is nil.
    var parent: ViewController?
    var children: [ViewController] = []
    
    public var navigationItem: NavigationItem?
    
    /// The nearest ancestor in the view controller hierarchy that is a navigation controller.
    /// This property is nil if the view controller is not embedded inside a navigation controller.
    public var navigationController: NavigationController?
    
    /// The nearest ancestor in the view controller hierarchy that is a tab bar controller.
    /// This property is nil if the view controller is not embedded inside a tab bar controller.
    public var tabController: TabBarController?
    public var tabBarItem: TabBarItem?
    
    /// The view controller that is being presented by this controller
    public var presentedViewController: ViewController?
    
    /// The view controller that is presenting this controller
    /// If the view controller was not presented modally, but one of its ancestors was,
    /// this property contains the view controller that presented the ancestor.
    /// If neither the current view controller or any of its ancestors were presented modally, the value in this property is nil.
    public var presentingViewController: ViewController?
    
    /// The root view acts primarily as a container for the rest of the view hierarchy.
    /// The size and position of the root view is determined by the object that owns it, which is either a parent view controller or the app’s window.
    /// The view controller that is owned by the window is the app’s root view controller and its view is sized to fill the window.
    /// View controllers load their views lazily. Accessing the view property for the first time loads or creates the view controller’s views.
    /// A view controller’s root view is always sized to fit its assigned space.
    /// TODO: When converting to UIKit, override `loadView` instead of this property
    public var view: View?
    
    public init(title: String? = nil)
    {
        self.title = title
    }
    
    open func loadView()
    {
        view = View()
    }
    
    /// This method is called after the view controller has loaded its view hierarchy into memory.
    /// You usually override this method to perform additional initialization on views that were loaded from nib files (so in general
    /// not the function we need)
    open func viewDidLoad()
    {
        if let presentedViewController = presentedViewController
        {
            presentedViewController.viewDidLoad()
            return
        }
    }
    
    /// This method is called before the view controller's view is about to be added to a view hierarchy
    open func viewWillAppear() { }
    
    open func viewDidAppear() { }
    
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

// MARK: - Container view controller

extension ViewController
{
    func addChild(_ child: ViewController)
    {
        child.willMove(toParent: self)
        children.append(child)
        child.parent = self
        child.didMove(toParent: self)
    }
    
    func didMove(toParent: ViewController?)
    {
        // Does this do anything?
    }
    
    func willMove(toParent: ViewController?)
    {
        // Does this do anything?
    }
    
    /// Removes the view controller from its parent
    func removeFromParent()
    {
        willMove(toParent: nil)
        parent?.children.removeAll { $0 == self }
        parent = nil
        didMove(toParent: nil)
    }
}
