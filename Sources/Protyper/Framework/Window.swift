//
//  File 2.swift
//  
//
//  Created by Josh Grant on 1/28/22.
//

import Foundation

/// No need to specify that the window is key, I mean, how many can there be in a command line app?
open class Window: View
{
    /// The root view controller provides the content view of the window.
    /// Assigning a view controller to this property (either programmatically or using Interface Builder)
    /// installs the view controller’s view as the content view of the window.
    public var rootViewController: ViewController?
    
    override open func draw()
    {
        rootViewController?.view?.draw()
    }
}
