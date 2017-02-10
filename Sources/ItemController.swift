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
    
    let fetchRequestController: NSFetchedResultsController<Item>
        static let shared = ItemController()
    
    
    init() {
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        let hasPurchedDescriptor = NSSortDescriptor(key: "hasPurchased", ascending: true)
        let dueDateDescriptor = NSSortDescriptor(key: "dueDate", ascending: true)
        fetchRequest.sortDescriptors = [hasPurchedDescriptor, dueDateDescriptor]
        self.fetchRequestController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
        
        do {
           try fetchRequestController.performFetch()
        } catch let error {
            print("fetch Controller fails.\n\(error)")
        }
    }
    
    
    // MARK: - Create
    func addItemWith(name: String) {
        let _ = Item(name: name)
        saveToPersistentData()
    }
    
    // MARK: - Read
    
//    var items: [Item] {
//        let request: NSFetchRequest<Item> = Item.fetchRequest()
//        return (try? CoreDataStack.context.fetch(request)) ?? []
//    }
    
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
