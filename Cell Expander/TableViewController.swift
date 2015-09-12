//
//  ViewController.swift
//  Cell Expander
//
//  Created by Christian Di Lorenzo on 4/7/15.
//  Copyright (c) 2015 Christian Di Lorenzo. All rights reserved.
//

import UIKit

let cellID = "cell"


let userType = ["Selecionar Meu Perfil","Jogador", "Empresario", "Clube"]

class TableViewController: UITableViewController {
    var selectedIndexPath : NSIndexPath?

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! PickerTableViewCell
        cell.titleLabel.text = "Test Title"
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let previousIndexPath = selectedIndexPath
        if indexPath == selectedIndexPath {
            selectedIndexPath = nil
        } else {
            selectedIndexPath = indexPath
        }
        
        var indexPaths : Array<NSIndexPath> = []
        if let previous = previousIndexPath {
            indexPaths += [previous]
        }
        if let current = selectedIndexPath {
            indexPaths += [current]
        }
        if indexPaths.count > 0 {
            tableView.reloadRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        (cell as! PickerTableViewCell).watchFrameChanges()
    }
    
    override func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        (cell as! PickerTableViewCell).ignoreFrameChanges()
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath == selectedIndexPath {
            return PickerTableViewCell.expandedHeight
        } else {
            return PickerTableViewCell.defaultHeight
        }
    }
    
    func datePicker(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return userType.count
    }
    
    func datePicker(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return userType[row]
    }
    
    func datePicker(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch row {
            
        case 0:
            println("Selecionar Meu Perfil")
        case 1:
            println("Jogador Selecionado")
            let pickedProfile = userType[row]
            
            
        case 2:
            println("Empresario Selecionado")
            let pickedProfile = userType[row]
            
            
        case 3:
            println("Clube Selecionado")
            let pickedProfile = userType[row]
            
            
        default:
            println("Nada Selecionado")
        }
        
        
    }


}

