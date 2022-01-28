//
//  File.swift
//  
//
//  Created by Josh Grant on 1/27/22.
//

import Foundation

open class TableViewCell: View
{
    private var stackView = StackView()
    
    public var components: [CellComponent]
    
    public var indentationLevel: Int = 0
    public var indentationWidth: Int = 0
    public var indentsAccessories: Bool = true
    
    public init(components: [CellComponent])
    {
        self.components = components
        
        let leadingAccessories = components.filter { $0.placement == .leading }
        let unalignedAccessories = components.filter { $0.placement == .none}
        let trailingAccessories = components.filter { $0.placement == .trailing }
        
        for leading in leadingAccessories
        {
            stackView.addArrangedSubview(leading.view)
        }
        
        for unaligned in unalignedAccessories
        {
            stackView.addArrangedSubview(unaligned.view)
        }
        
        for trailing in trailingAccessories
        {
            stackView.addArrangedSubview(trailing.view)
        }
        
        super.init()
        
        addSubview(stackView)
    }
    
    private var indentation: String
    {
        return " " * (indentationWidth * indentationLevel)
    }
}
