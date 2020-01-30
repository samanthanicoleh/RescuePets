//
//  SuccessPetsTableViewCell.swift
//  FinalProjectHolstead
//
//  Created by Samantha Holstead (RIT Student) on 11/29/19.
//  Copyright © 2019 Samantha Holstead (RIT Student). All rights reserved.
//

import UIKit

class SuccessPetsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var petImage: CachableImageView!

    @IBOutlet weak var adoptedLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
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
        self.adoptedLabel.text = pet.adoptedDesc
    }
    
}
