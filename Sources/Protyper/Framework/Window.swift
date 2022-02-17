//
//  File 2.swift
//  
//
//  Created by Josh Grant on 1/28/22.
//

import Foundation

fileprivate let source = """
activate application "Xcode"
tell application "System Events" to tell process "Xcode"
click menu item "Clear Console" of menu 1 of menu item "Debug Workflow" of menu 1 of menu bar item "Debug" of menu bar 1
end tell
"""

/// Do we need to consider key windows?
open class Window: View
{
    /// The root view controller provides the content view of the window.
    /// Assigning a view controller to this property (either programmatically or using Interface Builder)
    /// installs the view controller’s view as the content view of the window.
    public var rootViewController: ViewController?
    
    private lazy var script: NSAppleScript =
    {
        let script = NSAppleScript(source: source)
        var error: NSDictionary?
        script?.compileAndReturnError(&error)
        if error != nil { fatalError() }
        return script!
    }()
    
    public init(rootViewController: ViewController?)
    {
        super.init()
        
        guard let controller = rootViewController else { return }
        self.rootViewController = controller
        controller.loadView()
        guard let view = controller.view else { return }
        addSubview(view)
    }
    
    public func clear()
    {
        var error: NSDictionary?
        script.executeAndReturnError(&error)
        if let error = error { assertionFailure(error.description) }
    }
    
//    override open func draw()
//    {
//        rootViewController?.view?.draw()
//    }
}
