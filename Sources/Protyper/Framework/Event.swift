//
//  Event.swift
//  Protyper
//
//  Created by Joshua Grant on 1/17/22.
//

import Foundation

open class Event
{
    public var rawString: String
    public var timestamp: Date
    
    public init(rawString: String)
    {
        self.rawString = rawString
        self.timestamp = .now
    }
}
