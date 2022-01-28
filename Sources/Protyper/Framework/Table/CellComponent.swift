//
//  File.swift
//  
//
//  Created by Josh Grant on 1/27/22.
//

import Foundation

public struct CellComponent
{
    public enum AccessoryType
    {
        case index
        case disclosureIndicator
        case checkmark
        case label
        case customView
    }
    
    public enum Placement: Int, Comparable
    {
        case leading
        case none
        case trailing
        
        public static func < (lhs: CellComponent.Placement, rhs: CellComponent.Placement) -> Bool
        {
            return lhs.rawValue < rhs.rawValue
        }
    }
    
    public struct CustomViewConfiguration
    {
        let customView: View
        let placement: Placement
    }
    
    internal var accessoryType: AccessoryType
    internal var placement: Placement
    internal var view: View
    
    public static func index(_ index: Int) -> CellComponent
    {
        let view = TextView(text: String(index))
        return .init(accessoryType: .index,
                     placement: .leading,
                     view: view)
    }
    
    public static func disclosureIndicator() -> CellComponent
    {
        let view = TextView(text: "􀆊")
        return .init(accessoryType: .disclosureIndicator,
                     placement: .trailing,
                     view: view)
    }
    
    public static func checkmark() -> CellComponent
    {
        let view = TextView(text: "􀆅")
        return .init(accessoryType: .checkmark,
                     placement: .trailing,
                     view: view)
    }
    
    public static func label(text: String) -> CellComponent
    {
        let view = TextView(text: text)
        return .init(accessoryType: .label,
                     placement: .none,
                     view: view)
    }
    
    public static func customView(configuration: CustomViewConfiguration) -> CellComponent
    {
        return .init(accessoryType: .customView,
                     placement: configuration.placement,
                     view: configuration.customView)
    }
}
