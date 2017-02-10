//
//  ShoppingListItemCell.swift
//  ShoppingList
//
//  Created by Andrew Madsen on 2/9/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import UIKit

protocol ShoppingListItemCellDelegate: class {
	func shoppingListItemCompletionCheckboxTapped(item: ShoppingListItem)
}

class ShoppingListItemCell: UITableViewCell {
	
	@IBAction func completionCheckboxTapped(_ sender: UIButton) {
		guard let item = shoppingListItem else { return }
		delegate?.shoppingListItemCompletionCheckboxTapped(item: item)
	}

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
	
	weak var delegate: ShoppingListItemCellDelegate?
	@IBOutlet var nameLabel: UILabel!
	@IBOutlet var completionCheckbox: UIButton!
}
