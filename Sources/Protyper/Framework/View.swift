//
//  View.swift
//  Protyper
//
//  Created by Joshua Grant on 1/20/22.
//

import Foundation

/// View drawing occurs on an as-needed basis.
/// When a view is first shown, or when all or part of it becomes visible due to layout changes, the system asks the view to draw its contents.
///
/// When the actual content of your view changes, it is your responsibility to notify the system that your view needs to be redrawn.
/// You do this by calling your view’s setNeedsDisplay() or setNeedsDisplay(_:) method of the view.
/// These methods let the system know that it should update the view during the next drawing cycle.
/// Because it waits until the next drawing cycle to update the view, you can call these methods on multiple views to update them at the same time.
open class View: Responder, Identifiable
{
    public var id = UUID()
    
    /// Should be set when we load a view in a view controller
    weak var controller: ViewController?
    
    var superview: View? = nil
    var subviews: [View] = []
    
    /// A Boolean value that determines whether the view is hidden.
    var isHidden: Bool = false
    
    /// A Boolean value that determines whether user events are ignored and removed from the event queue.
    var isUserInteractionEnabled: Bool = true
    
    /// A Boolean value that indicates whether the receiver handles touch events exclusively.
    /// NOTE: I'm assuming if `true`, that the view doesn't forward events to the parent view controller
    var isExclusiveTouch: Bool = false
    
    /// UIView implements this method and returns the UIViewController object that manages it (if it has one) or its superview (if it doesn’t)
    override var next: Responder?
    {
        get { controller ?? superview }
        set { super.next = newValue }
    }
    
    override public init() { }
    
    public func draw()
    {
        for subview in subviews
        {
            subview.draw()
        }
    }
    
    func addSubview(_ view: View)
    {
        subviews.append(view)
        view.superview = self
    }
    
    func insertSubview(_ view: View, at index: Int)
    {
        subviews.insert(view, at: index)
        view.superview = self
    }
    
    func insertSubview(_ view: View, below subview: View)
    {
        guard let index = subviews.firstIndex(of: subview) else
        {
            fatalError("No subview matching: \(subview)")
        }
        
        let newIndex = subviews.index(before: index)
        subviews.insert(view, at: newIndex)
        view.superview = self
    }
    
    func insertSubview(_ view: View, above subview: View)
    {
        guard let index = subviews.firstIndex(of: subview) else
        {
            fatalError("No subview matching: \(subview)")
        }
        
        let newIndex = subviews.index(after: index)
        subviews.insert(view, at: newIndex)
        view.superview = self
    }
    
    private func removeSubview(_ view: View)
    {
        subviews.removeAll { $0 == view }
    }
    
    /// Unlinks the view from its superview and its window, and removes it from the responder chain.
    func removeFromSuperview()
    {
        superview?.removeSubview(self)
        resignFirstResponder()
    }
    
    func isDescendant(of view: View) -> Bool
    {
        if self == view
        {
            return true
        }
        
        return superview?.isDescendant(of: view) ?? false
    }
}
