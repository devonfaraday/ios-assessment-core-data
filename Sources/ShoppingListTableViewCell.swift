//
//  ShoppingListTableViewCell.swift
//  ShoppingList
//
//  Created by Christian McMullin on 2/10/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {

    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var hasPurchasedButton: UIButton!
    
    var delegate: ShoppingListTableViewCellDelegate?
    
    var item: Item? {
        didSet {
            updateViews()
        }
    }
    
    @IBAction func hasPurchaedButtonTapped(_ sender: Any) {
        delegate?.buttonCellButtonTapped(self)
    }
    
    func updateViews() {
        guard let item = item else { return }
        itemLabel.text = item.name
        let images = item.hasPurchased ? #imageLiteral(resourceName: "complete") : #imageLiteral(resourceName: "incomplete")
        hasPurchasedButton.setImage(images, for: .normal)
    }
}

protocol ShoppingListTableViewCellDelegate {
    func buttonCellButtonTapped(_ sender: ShoppingListTableViewCell)
}
