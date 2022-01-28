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
    
    open override func draw()
    {
        for view in views
        {
            view.draw()
            
            switch axis
            {
            case .horizontal:
                print(" " * spacing, terminator: "")
            case .vertical:
                print("")
            }
        }
    }
}
