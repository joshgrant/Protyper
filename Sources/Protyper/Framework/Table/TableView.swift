//
//  TableView.swift
//  
//
//  Created by Josh Grant on 1/26/22.
//

import Foundation

open class TableView: View
{
    public weak var dataSource: TableViewDataSource?
    public weak var delegate: TableViewDelegate?
    
    public override init()
    {
        
    }
    
    open override var content: String
    {
        var output: String = ""
        
        let numberOfSections = dataSource?.numberOfSections(in: self) ?? 1
        for section in 0 ..< numberOfSections
        {
            if let header = dataSource?.tableView(self, titleForHeaderInSection: section)
            {
                output += header
                output += .newline
                output += .divider
                output += .newline
            }
            
            let numberOfRows = dataSource?.tableView(self, numberOfRowsInSection: section) ?? 0
            for row in 0 ..< numberOfRows
            {
                let indexPath = Index(section: section, row: row)
                let cell = dataSource?.tableView(self, cellForRowAt: indexPath)
                output += cell?.content ?? ""
                output += .newline
            }
            
            if let footer = dataSource?.tableView(self, titleForFooterInSection: section)
            {
                output += footer
                output += .newline
            }
            else
            {
                output += .newline
            }
        }
        
        return output
    }
    
    open override func handle(command: Command)
    {
        guard let command = TableSelectionCommand(command: command) else
        {
            return super.handle(command: command)
        }
        
        let indexPath = Index(section: command.section ?? -1, row: command.row ?? -1)
        
        if let action = command.action
        {
            delegate?.tableView(self, performAction: action, forRowAtIndexPath: indexPath)
        }
        else
        {
            delegate?.tableView(self, didSelectRowAt: indexPath)
        }
    }
}
