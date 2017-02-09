//
//  ShoppingListController.swift
//  ShoppingList
//
//  Created by Andrew Madsen on 2/9/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class ShoppingListController {
	
	static let shared = ShoppingListController()
	
	private init() {
		container = NSPersistentContainer(name: "Model")
		container.loadPersistentStores { (description, error) in
			if let error = error {
				NSLog("Error loading persistent stores: \(error)")
				return
			}
		}
	}
	
	// MARK: Overridden
	
	// MARK: Public Methods
	
	@discardableResult func createShoppingListItem(name: String) -> ShoppingListItem {
		let item = ShoppingListItem(context: container.viewContext, name: name)
		saveManagedObjectContext()
		return item
	}
	
	func delete(shoppingListItem: ShoppingListItem) {
		container.viewContext.delete(shoppingListItem)
		saveManagedObjectContext()
	}
	
	// MARK: Actions

	// MARK: Private Methods
	
	private func saveManagedObjectContext() {
		do {
			try container.viewContext.save()
		} catch {
			NSLog("Error saving managed object context: \(error)")
		}
	}
	
	// MARK: Public Properties
	
	var shoppingListItems: [ShoppingListItem] {
		let fetchRequest: NSFetchRequest<ShoppingListItem> = ShoppingListItem.fetchRequest()
		var result = [ShoppingListItem]()
		container.viewContext.performAndWait {
			do {
				result = try fetchRequest.execute()
			} catch {
				NSLog("Error fetching shopping list items: \(error)")
			}
		}
		return result
	}
	
	// MARK: Private Properties
	
	private let container: NSPersistentContainer
}
