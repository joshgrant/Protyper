//
//  File.swift
//  
//
//  Created by Josh Grant on 1/28/22.
//

import Foundation

class TableHeaderView: View
{
    var title: String
    
    init(title: String)
    {
        self.title = title
    }
    
    override func draw()
    {
        var output = title + .newline + .divider
        print(output)
    }
}
