//
//  FavouritePetsTableViewCell.swift
//  FinalProjectHolstead
//
//  Created by Samantha Holstead (RIT Student) on 11/29/19.
//  Copyright © 2019 Samantha Holstead (RIT Student). All rights reserved.
//

import UIKit

class FavouritePetsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var petImage: CachableImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static var reuseIdentifier: String {
           return String(describing: self)
       }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // Function to configure for cells (which image/text will be displayed)
    func configure(for pet: Pet) {
        self.petImage.loadImage(using: pet.imageUrl)
        self.nameLabel.text = pet.name
    }
    
}
