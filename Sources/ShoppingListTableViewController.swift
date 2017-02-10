//
//  ShoppingListTableViewController.swift
//  ShoppingList
//
//  Created by Christian McMullin on 2/10/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import UIKit

class ShoppingListTableViewController: UITableViewController, ShoppingListTableViewCellDelegate {
   
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemController.shared.items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingListCell", for: indexPath) as? ShoppingListTableViewCell else { return ShoppingListTableViewCell() }
        let item = ItemController.shared.items[indexPath.row]
        
        cell.item = item
        cell.delegate = self
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = ItemController.shared.items[indexPath.row] 
            ItemController.shared.delete(item: item)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func buttonCellButtonTapped(_ sender: ShoppingListTableViewCell) {
        guard let indexPath = tableView.indexPath(for: sender),
            let item = sender.item else { return }
        ItemController.shared.hasPurchagedToggled(item: item)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        let actionController = UIAlertController(title: "Add Item", message: "Enter Item to purchase", preferredStyle: .alert)
        var itemNameTextField: UITextField?
        actionController.addTextField { (textField) in
            itemNameTextField = textField
        }
        let addActionTapped = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let itemName = itemNameTextField?.text else { return }
            ItemController.shared.addItemWith(name: itemName)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        actionController.addAction(addActionTapped)
        actionController.addAction(cancelAction)
        
        present(actionController, animated: true, completion: nil)
        
    }
    
    
    
}
