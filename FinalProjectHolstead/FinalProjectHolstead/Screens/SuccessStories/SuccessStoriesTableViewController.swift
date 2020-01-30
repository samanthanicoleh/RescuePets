//
//  SuccessStoriesTableViewController.swift
//  FinalProjectHolstead
//
//  Created by Samantha Holstead (RIT Student) on 11/29/19.
//  Copyright © 2019 Samantha Holstead (RIT Student). All rights reserved.
//

import UIKit

class SuccessStoriesTableViewController: UITableViewController {
    
    var pet: Pet?
    
    private var data: [Pet] {
        return DataManager.shared.getAdoptedPets()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "SuccessPetsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: SuccessPetsTableViewCell.reuseIdentifier)
        
        tableView.rowHeight = 178

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
           guard let cell = tableView.dequeueReusableCell(withIdentifier: SuccessPetsTableViewCell.reuseIdentifier, for: indexPath) as? SuccessPetsTableViewCell else {
               return UITableViewCell()
           }
            
        let pet = data[indexPath.row]
        cell.configure(for: pet)

        return cell
    }
    

}
