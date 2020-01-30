//
//  FavouritesTableViewController.swift
//  FinalProjectHolstead
//
//  Created by Samantha Holstead (RIT Student) on 11/29/19.
//  Copyright © 2019 Samantha Holstead (RIT Student). All rights reserved.
//

import UIKit

class FavouritesTableViewController: UITableViewController {
    
    private var data: [Pet] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "FavouritePetsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: FavouritePetsTableViewCell.reuseIdentifier)
        tableView.rowHeight = 79
        
        tableView.reloadData()
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        data = DataManager.shared.getFavouritePets()
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavouritePetsTableViewCell.reuseIdentifier, for: indexPath) as? FavouritePetsTableViewCell else {
            return UITableViewCell()
        }

        let pet = data[indexPath.row]
        cell.configure(for: pet)

        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let petToRemove = data[indexPath.row]
            data.remove(at: indexPath.row)
            DataManager.shared.removeFromFavouritePets(pet: petToRemove)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        tableView.reloadData()
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let pet = data.remove(at: fromIndexPath.row)
        data.insert(pet, at: to.row)
        DataManager.shared.rearrangePositionFavouritePets(movePet: pet, to: to.row)
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueIdentifierFavouritesToDetail", sender: nil)
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailTableViewController = segue.destination as? PetDetailsTableViewController, let row = tableView.indexPathForSelectedRow?.row { // has destination and can retrieve selected row from the table view
            let pet = data[row]
            detailTableViewController.pet = pet
            
        }
    }

}
