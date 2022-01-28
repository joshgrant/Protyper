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
    
    override public init() { }
    
    public override func update()
    {
//        print("\u{001B}[2J") // Clear the screen
//        system("clear")
        let script = NSAppleScript(source: """
                                    activate application "Xcode"

                                    tell application "System Events" to tell process "Xcode"
                                        
                                        click menu item "Clear Console" of menu 1 of menu item "Debug Workflow" of menu 1 of menu bar item "Debug" of menu bar 1
                                        
                                    end tell
""")
        var error: NSDictionary?
        script?.executeAndReturnError(&error)
        if let error = error {
            print(error)
        }
        // TODO: This seems strange
        rootViewController?.view?.update()
    }
    
    override open func draw()
    {
        rootViewController?.view?.draw()
    }
    
    open func makeVisible()
    {
        rootViewController?.viewWillAppear()
        rootViewController?.view?.draw()
        rootViewController?.viewDidAppear()
    }
}
