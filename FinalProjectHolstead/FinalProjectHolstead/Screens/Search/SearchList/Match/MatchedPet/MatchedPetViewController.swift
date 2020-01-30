//
//  MatchedPetViewController.swift
//  FinalProjectHolstead
//
//  Created by Samantha Holstead (RIT Student) on 12/6/19.
//  Copyright © 2019 Samantha Holstead (RIT Student). All rights reserved.
//

import UIKit

class MatchedPetViewController: UIViewController {
    
    private var pet: Pet {
        DataManager.shared.getMatch()[0]
    }

    @IBOutlet weak var matchedPetImage: CachableImageView!
    @IBOutlet weak var matchedPetNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        matchedPetNameLabel.text = pet.name + "!"
        self.matchedPetImage.loadImage(using: pet.imageUrl)
    }
    


}
