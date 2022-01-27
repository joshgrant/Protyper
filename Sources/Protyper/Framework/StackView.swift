//
//  StackView.swift
//
//  Created by Josh Grant on 1/27/22.
//

import Foundation

open class StackView: View
{
    enum Axis
    {
        case horizontal
        case vertical
    }
    
    var views: [View]
    var axis: Axis = .horizontal
    var spacing: Int = 1
    
    override init()
    {
        self.views = []
    }
    
    func addArrangedSubview(_ view: View)
    {
        views.append(view)
    }
    
    func insertArrangedSubview(_ view: View, at index: Int)
    {
        views.insert(view, at: index)
    }
    
    open override var content: String
    {
        var output: String = ""
        
        for view in views
        {
            let content = view.content
            output += content
            
            switch axis
            {
            case .horizontal:
                output += (" " * spacing)
            case .vertical:
                output += ("\n" * spacing)
            }
        }
        
        return output
    }
}
