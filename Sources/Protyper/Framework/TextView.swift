//
//  TextView.swift
//
//  Created by Josh Grant on 1/26/22.
//

import Foundation

open class TextView: View
{
    var text: String
    
    init(text: String)
    {
        self.text = text
    }
    
    open override func draw()
    {
        print(text, terminator: "")
    }
}
