//
//  File.swift
//  
//
//  Created by Josh Grant on 1/28/22.
//

import Foundation

class TableFooterView: View
{
    var title: String
    
    init(title: String)
    {
        self.title = title
    }
    
    override func draw()
    {
        var output = title + .newline
        print(output)
    }
}
