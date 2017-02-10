//
//  ItemController.swift
//  ShoppingList
//
//  Created by Christian McMullin on 2/10/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import Foundation
import CoreData


class ItemController {
    
        static let shared = ItemController()
    
    // MARK: - Create
    func addItemWith(name: String) {
        let _ = Item(name: name)
        saveToPersistentData()
    }
    
    // MARK: - Read
    
    var items: [Item] {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        return (try? CoreDataStack.context.fetch(request)) ?? []
    }
    
    // MARK: - Update
    func hasPurchagedToggled(item: Item) {
        item.hasPurchased = !item.hasPurchased
        saveToPersistentData()
    }
    
    
    // MARK: - Delete
    func delete(item: Item) {
        let moc = CoreDataStack.context
        moc.delete(item)
        saveToPersistentData()
    }
    
    // MARK: - Saving
    
    func saveToPersistentData() {
        let moc = CoreDataStack.context
        do {
            try moc.save()
        } catch let error {
            print("saving to persistent store fails.\n\(error)")
        }
    }
    

    
    
}
