//
//  ShoppingListTableViewController.swift
//  ShoppingList
//
//  Created by Christian McMullin on 2/10/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import UIKit

class ShoppingListTableViewController: UITableViewController, ShoppingListTableViewCellDelegate {
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let section = ItemController.shared.fetchRequestController.sections else {
            return 0
        }
        return section.count
    }
    
    // Setting number of Rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = ItemController.shared.fetchRequestController.sections else { return 0}
        let sectionInfo = sections[section]
        return sectionInfo.numberOfObjects
    }
    
    
    // Configuring the cell to pull info from my custom cell file
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingListCell", for: indexPath) as? ShoppingListTableViewCell else { return ShoppingListTableViewCell() }
       let item = ItemController.shared.fetchRequestController.object(at: indexPath)
        
        cell.item = item
        cell.delegate = self
        
             
        return cell
    }
    
    // Deleting items from list
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //let item = ItemController.shared.items[indexPath.row]
           // ItemController.shared.delete(item: item)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // toggles button image
    func buttonCellButtonTapped(_ sender: ShoppingListTableViewCell) {
        guard let indexPath = tableView.indexPath(for: sender),
            let item = sender.item else { return }
        ItemController.shared.hasPurchagedToggled(item: item)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    // Created an alert controller connected to the add button in the navigation bar.  Added a text field to alert controller to type in items you want to add to the list.
    @IBAction func addButtonTapped(_ sender: Any) {
        // alert controller created
        let actionController = UIAlertController(title: "Add Item", message: "Enter Item to purchase", preferredStyle: .alert)
        //created textField
        var itemNameTextField: UITextField?
        //added a text field to alert controller
        actionController.addTextField { (textField) in
            itemNameTextField = textField
        }
        // when add action is tapped it will add the item in the text field to the shopping list
        let addActionTapped = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let itemName = itemNameTextField?.text else { return }
            ItemController.shared.addItemWith(name: itemName)
            self.tableView.reloadData()
        }
        // cancel action ... yep
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        // adding the actions to the controller
        actionController.addAction(addActionTapped)
        actionController.addAction(cancelAction)
    
        // when add button is tapped it will present the controller
        present(actionController, animated: true, completion: nil)
        
    }
    
    
    
}
