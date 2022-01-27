//
//  File.swift
//  
//
//  Created by Josh Grant on 1/27/22.
//

import Foundation

public protocol TableViewDelegate: AnyObject
{
    func tableView(_ tableView: TableView, didSelectRowAt indexPath: Index)
    func tableView(_ tableView: TableView, performAction action: String, forRowAtIndexPath indexPath: Index)
}

public extension TableViewDelegate
{
    func tableView(_ tableView: TableView, didSelectRowAt indexPath: Index) { }
    func tableView(_ tableView: TableView, performAction action: String, forRowAtIndexPath indexPath: Index) { }
}
