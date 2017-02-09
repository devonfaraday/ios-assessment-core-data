//
//  ShoppingListTableViewController.swift
//  ShoppingList
//
//  Created by Andrew Madsen on 2/9/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import UIKit

class ShoppingListTableViewController: UITableViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Uncomment the following line to preserve selection between presentations
		// self.clearsSelectionOnViewWillAppear = false
		
		// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
		// self.navigationItem.rightBarButtonItem = self.editButtonItem()
	}
	
	@IBAction func addNewItem(_ sender: Any) {
		let alertController = UIAlertController(title: "Add Item", message: "Please add an item to your shopping list", preferredStyle: .alert)
		
		var textField: UITextField!
		alertController.addTextField { (newTextField) in
			textField = newTextField
		}
		
		let addAction = UIAlertAction(title: "Add", style: .default) { (action) in
			if let name = textField.text {
				ShoppingListController.shared.createShoppingListItem(name: name)
				self.tableView.reloadData()
			}
			alertController.dismiss(animated: true, completion: nil)
		}
		alertController.addAction(addAction)
		
		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { __SRD in
			alertController.dismiss(animated: true, completion: nil)
		}
		alertController.addAction(cancelAction)
		
		present(alertController, animated: true, completion: nil)
	}
	
	// MARK: UITableViewDataSource/Delegate
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return ShoppingListController.shared.shoppingListItems.count
	}
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingListItemCell", for: indexPath) as? ShoppingListItemCell else {
			return ShoppingListItemCell()
		}
		
		cell.shoppingListItem = ShoppingListController.shared.shoppingListItems[indexPath.row]
		
		return cell
	}
	
	// Override to support editing the table view.
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			let controller = ShoppingListController.shared
			let item = controller.shoppingListItems[indexPath.row]
			controller.delete(shoppingListItem: item)
			tableView.deleteRows(at: [indexPath], with: .fade)
		}
	}
}
