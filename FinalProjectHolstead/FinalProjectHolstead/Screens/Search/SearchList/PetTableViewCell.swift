//
//  PetTableViewCell.swift
//  FinalProjectHolstead
//
//  Created by Samantha Holstead (RIT Student) on 11/29/19.
//  Copyright © 2019 Samantha Holstead (RIT Student). All rights reserved.
//

import UIKit

class PetTableViewCell: UITableViewCell {
    
    @IBOutlet weak var petImage: CachableImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var noResultsFoundLabel: UILabel!
    @IBOutlet weak var noResultsImage: CachableImageView!
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(for pet: Pet) {
        self.petImage.loadImage(using: pet.imageUrl)
        self.nameLabel.text = pet.name
        self.noResultsFoundLabel.isHidden = true
        self.noResultsImage.isHidden = true
    }
    
    func configureNoResults() {
        self.nameLabel.isHidden = true
        self.noResultsFoundLabel.isHidden = false
        self.noResultsImage.isHidden = false
    }
    
}
