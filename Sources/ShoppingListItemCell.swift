//
//  ShoppingListItemCell.swift
//  ShoppingList
//
//  Created by Andrew Madsen on 2/9/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import UIKit

class ShoppingListItemCell: UITableViewCell {

	private func updateViews() {
		guard let item = shoppingListItem else {
			nameLabel.text = ""
			completionCheckbox.image = #imageLiteral(resourceName: "incomplete")
			return
		}
		
		nameLabel.text = item.name
		completionCheckbox.image = item.complete ? #imageLiteral(resourceName: "complete") : #imageLiteral(resourceName: "incomplete")
	}

	var shoppingListItem: ShoppingListItem? {
		didSet {
			updateViews()
		}
	}
	
	@IBOutlet var nameLabel: UILabel!
	@IBOutlet var completionCheckbox: UIImageView!
}
