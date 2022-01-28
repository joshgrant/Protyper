//
//  File.swift
//  
//
//  Created by Josh Grant on 1/27/22.
//

import Foundation

open class TableViewCell: View
{
    private var stackView: StackView
    
    public var accessories: [CellAccessory]
    
    public var indentationLevel: Int = 0
    public var indentationWidth: Int = 0
    public var indentsAccessories: Bool = true
    
    public init(contentView: View?, accessories: [CellAccessory])
    {
        self.stackView = StackView()
        self.accessories = accessories
        
        let leadingAccessories = accessories.filter { $0.placement == .leading }
        let unalignedAccessories = accessories.filter { $0.placement == .none}
        let trailingAccessories = accessories.filter { $0.placement == .trailing }
        
        for leading in leadingAccessories
        {
            stackView.addArrangedSubview(leading.view)
        }
        
        if let contentView = contentView
        {
            stackView.addArrangedSubview(contentView)
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
