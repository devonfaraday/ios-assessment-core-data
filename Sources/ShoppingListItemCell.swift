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
			completionCheckbox.setImage(#imageLiteral(resourceName: "incomplete"), for: .normal)
			return
		}
		
		nameLabel.text = item.name
		let image = item.complete ? #imageLiteral(resourceName: "complete") : #imageLiteral(resourceName: "incomplete")
		completionCheckbox.setImage(image, for: .normal)
	}

	var shoppingListItem: ShoppingListItem? {
		didSet {
			updateViews()
		}
	}
	
	@IBOutlet var nameLabel: UILabel!
	@IBOutlet var completionCheckbox: UIButton!
}
