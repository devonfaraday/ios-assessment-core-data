//
//  Item+Convenience.swift
//  ShoppingList
//
//  Created by Christian McMullin on 2/10/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import Foundation
import CoreData

extension Item {
    @discardableResult convenience init(name: String, hasPurchased: Bool = false, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.hasPurchased = hasPurchased
        
    }
}
