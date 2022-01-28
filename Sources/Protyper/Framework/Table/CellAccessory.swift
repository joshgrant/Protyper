//
//  File.swift
//  
//
//  Created by Josh Grant on 1/27/22.
//

import Foundation

public struct CellAccessory
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
        
        public static func < (lhs: CellAccessory.Placement, rhs: CellAccessory.Placement) -> Bool
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
    
    public static func index(_ index: Int) -> CellAccessory
    {
        let view = TextView(text: String(index))
        return .init(accessoryType: .index,
                     placement: .leading,
                     view: view)
    }
    
    public static func disclosureIndicator() -> CellAccessory
    {
        let view = TextView(text: "􀆊")
        return .init(accessoryType: .disclosureIndicator,
                     placement: .trailing,
                     view: view)
    }
    
    public static func checkmark() -> CellAccessory
    {
        let view = TextView(text: "􀆅")
        return .init(accessoryType: .checkmark,
                     placement: .trailing,
                     view: view)
    }
    
    public static func label(text: String) -> CellAccessory
    {
        let view = TextView(text: text)
        return .init(accessoryType: .label,
                     placement: .none,
                     view: view)
    }
    
    public static func customView(configuration: CustomViewConfiguration) -> CellAccessory
    {
        return .init(accessoryType: .customView,
                     placement: configuration.placement,
                     view: configuration.customView)
    }
}
