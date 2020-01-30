//
//  SuccessStoriesViewController.swift
//  FinalProjectHolstead
//
//  Created by Samantha Holstead (RIT Student) on 12/9/19.
//  Copyright © 2019 Samantha Holstead (RIT Student). All rights reserved.
//

import UIKit

class SuccessStoriesViewController: UIViewController {

    @IBOutlet weak var revealButton: UIButton!
    @IBOutlet weak var longestPetImage: CachableImageView!
    @IBOutlet weak var petNameLabel: UILabel!
    
    var pet = DataManager.shared.getPetLongestInShelter()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        longestPetImage.isHidden = true
        petNameLabel.isHidden = true
    }
    

    @IBAction func didTapRevealButton(_ sender: Any) {
        longestPetImage.isHidden = false
        revealButton.isHidden = true
        petNameLabel.isHidden = false
        petNameLabel.text = pet.name
        longestPetImage.loadImage(using: pet.imageUrl)
    }


}
