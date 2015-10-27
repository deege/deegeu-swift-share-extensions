//
//  ColorSelectionViewController.swift
//  deegeu-swift-share-extensions
//
//  Created by Daniel Spiess on 10/26/15.
//  Copyright © 2015 Daniel Spiess. All rights reserved.
//

import UIKit

@objc(ColorSelectionViewControllerDelegate)
protocol ColorSelectionViewControllerDelegate {
    optional func colorSelection(
        sender: ColorSelectionViewController,
        selectedValue: String)
}

class ColorSelectionViewController : UITableViewController {
    
    let colorSelections = [ "Default", "Red", "Blue" ]
    let tableviewCellIdentifier = "colorSelectionCell"
    var selectedColorName : String = "Default"
    var delegate: ColorSelectionViewControllerDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // Initialize the tableview
    override init(style: UITableViewStyle) {
        super.init(style: style)
        tableView.registerClass(UITableViewCell.classForCoder(),
                forCellReuseIdentifier: tableviewCellIdentifier)
        title = "Choose Color"
    }
    
    // We only have three choices, but there's no reason this tableview can't be populated
    // dynamically from CoreData, NSDefaults, or something else.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    // This just populates each row in the table, and if we've selected it, we'll check it
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(
            tableviewCellIdentifier,
            forIndexPath: indexPath) as UITableViewCell
        
        let text = colorSelections[indexPath.row] 
        cell.textLabel!.text = text
        
        if text == selectedColorName {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        return cell
    }
    
    // Save the value the user picks
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let theDelegate = delegate {
            selectedColorName = colorSelections[indexPath.row]
            theDelegate.colorSelection!(self, selectedValue: selectedColorName)
        }
    }
    

    
}