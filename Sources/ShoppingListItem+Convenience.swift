//
//  ShoppingListItem+Convenience.swift
//  ShoppingList
//
//  Created by Andrew Madsen on 2/9/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import Foundation
import CoreData

extension ShoppingListItem {
	convenience init(context: NSManagedObjectContext, name: String) {
		self.init(context: context)
		
		self.name = name
	}
}
