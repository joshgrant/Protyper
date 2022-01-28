//
//  File.swift
//  
//
//  Created by Josh Grant on 1/28/22.
//

import Foundation

open class Responder
{
    /// The next object in the responder chain or nil if this is the last object in the chain.
    var next: Responder? = nil
    var isFirstResponder: Bool = false
    var canBecomeFirstResponder: Bool = true
    var canResignFirstResponder: Bool = true
    
    private var firstResponder: Responder?
    {
        if isFirstResponder { return self }
        return next?.firstResponder
    }
    
    /// Call this method when you want the current object to be the first responder.
    /// Calling this method is not a guarantee that the object will become the first responder.
    /// UIKit asks the current first responder to resign as first responder, which it might not.
    /// If it does, UIKit calls this object's canBecomeFirstResponder method, which returns false by default.
    /// If this object succeeds in becoming the first responder, subsequent events targeting the first responder are delivered to this object first and UIKit attempts to display the object's input view, if any.
    @discardableResult func becomeFirstResponder() -> Bool
    {
        guard canBecomeFirstResponder else { return false }
        guard firstResponder?.resignFirstResponder() ?? false else { return false }
        
        // TODO: Does the first responder have to resign?
        isFirstResponder = true
        return true
    }
    
    @discardableResult func resignFirstResponder() -> Bool
    {
        guard canResignFirstResponder else { return false }
        guard next?.becomeFirstResponder() ?? false else { return false }
        
        // TODO: Does `next` have to become first responder?
        isFirstResponder = false
        return true
    }
    
    /// The default implementation of this method forwards the message up the responder chain.
    /// When creating your own subclasses, call super to forward any commands that you do not handle yourself.
    open func handle(command: Command)
    {
        next?.handle(command: command)
    }
}
