//
//  SearchListTableViewController.swift
//  FinalProjectHolstead
//
//  Created by Samantha Holstead (RIT Student) on 11/26/19.
//  Copyright © 2019 Samantha Holstead (RIT Student). All rights reserved.
//

import UIKit

class SearchListTableViewController: UITableViewController {
    
    private var data: [Pet] {
        return DataManager.shared.getNotAdoptedPets()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "PetTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: PetTableViewCell.reuseIdentifier)
        
        tableView.rowHeight = 193
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PetTableViewCell.reuseIdentifier, for: indexPath) as? PetTableViewCell else {
            return UITableViewCell()
        }

        let pet = data[indexPath.row]
        cell.configure(for: pet)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueIdentifier", sender: nil)
    }


    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailTableViewController = segue.destination as? PetDetailsTableViewController, let row = tableView.indexPathForSelectedRow?.row { // has destination and can retrieve selected row from the table view
            let pet = data[row]
            detailTableViewController.pet = pet
            
        }
    }


}
