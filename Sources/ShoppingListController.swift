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
		save()
		return item
	}
	
	func delete(shoppingListItem: ShoppingListItem) {
		container.viewContext.delete(shoppingListItem)
		save()
	}
	
	func save() {
		do {
			try container.viewContext.save()
		} catch {
			NSLog("Error saving managed object context: \(error)")
		}
	}

	// MARK: Private Methods
	
	// MARK: Public Properties
	
	var shoppingListItems: [ShoppingListItem] {
		let fetchRequest: NSFetchRequest<ShoppingListItem> = ShoppingListItem.fetchRequest()
		fetchRequest.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
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
