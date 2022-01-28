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
    
    open override func draw()
    {
        guard let dataSource = dataSource else { fatalError("\(self) does not have a data source") }
        
        let numberOfSections = dataSource.numberOfSections(in: self)
        for section in 0 ..< numberOfSections
        {
            if let header = dataSource.tableView(self, titleForHeaderInSection: section)
            {
                let headerView = TableHeaderView(title: header)
                headerView.draw()
            }
            
            let numberOfRows = dataSource.tableView(self, numberOfRowsInSection: section)
            for row in 0 ..< numberOfRows
            {
                let indexPath = Index(section: section, row: row)
                let cell = dataSource.tableView(self, cellForRowAt: indexPath)
                cell.draw()
                print("")
            }
            
            if let footer = dataSource.tableView(self, titleForFooterInSection: section)
            {
                let footerView = TableFooterView(title: footer)
                footerView.draw()
            }
            else
            {
                print("")
            }
        }
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
