//
//  PetDetailsTableViewController.swift
//  FinalProjectHolstead
//
//  Created by Samantha Holstead (RIT Student) on 11/29/19.
//  Copyright © 2019 Samantha Holstead (RIT Student). All rights reserved.
//

import UIKit

class PetDetailsTableViewController: UITableViewController {
    
    var pet: Pet?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var petImage: CachableImageView!
    @IBOutlet weak var kidsLabel: UILabel!
    @IBOutlet weak var animalsLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let pet = self.pet else {return}
        nameLabel.text = pet.name
        self.petImage.loadImage(using: pet.imageUrl)
        
        // likes kids
        if pet.likesKids == true {
            kidsLabel.text = "Yes"
        }
        else {
            kidsLabel.text = "No"
        }
        
        // likes animals
        if pet.likesAnimals == true {
            animalsLabel.text = "Yes"
        }
        else {
            animalsLabel.text = "No"
        }
        
        // house trained
        if pet.houseTrained == true {
            houseLabel.text = "Yes"
        }
        else {
            houseLabel.text = "No"
        }
        
        aboutLabel.text = pet.about
    }

    
    @IBAction func didClickAddToFavourites(_ sender: Any) {
        guard let petToAddToFavourites = self.pet else {return}
        DataManager.shared.addToFavouritePets(pet: petToAddToFavourites)
        
        
        // ALERT
        let alertController = UIAlertController(title: "\(petToAddToFavourites.name) was added to favourites.", message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func didClickAdoptButton(_ sender: Any) {
    }


    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "adoptSegueIdentifier", sender: nil)
    }
    
    private var data: [Pet] {
        return DataManager.shared.getPets()
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let adoptViewController = segue.destination as? AdoptViewController, let row = tableView.indexPathForSelectedRow?.row {
            let pet = data[row]
            adoptViewController.pet = pet
            
        }
    }


}
