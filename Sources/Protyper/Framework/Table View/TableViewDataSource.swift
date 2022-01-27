//
//  File.swift
//  
//
//  Created by Josh Grant on 1/27/22.
//

import Foundation

public protocol TableViewDataSource: AnyObject
{
    func numberOfSections(in tableView: TableView) -> Int
    func tableView(_ tableView: TableView, numberOfRowsInSection section: Int) -> Int
    func tableView(_ tableView: TableView, cellForRowAt indexPath: Index) -> TableViewCell
    func tableView(_ tableView: TableView, titleForHeaderInSection section: Int) -> String?
    func tableView(_ tableView: TableView, titleForFooterInSection section: Int) -> String?
}

public extension TableViewDataSource
{
    func numberOfSections(in tableView: TableView) -> Int { 1 }
    func tableView(_ tableView: TableView, titleForHeaderInSection section: Int) -> String? { return nil }
    func tableView(_ tableView: TableView, titleForFooterInSection section: Int) -> String? { return nil }
}
