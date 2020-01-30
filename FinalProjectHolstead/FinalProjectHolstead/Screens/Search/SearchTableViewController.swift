//
//  SearchTableViewController.swift
//  FinalProjectHolstead
//
//  Created by Samantha Holstead (RIT Student) on 11/26/19.
//  Copyright © 2019 Samantha Holstead (RIT Student). All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var animalSegmentedControl: UISegmentedControl!
    @IBOutlet weak var breedPicker: UIPickerView!
    
    // Setting the default values to false
    var goodWithKidsBool: Bool = false
    var goodWithAnimalsBool: Bool = false
    var houseTrainedBool: Bool = false
    
    // Data for the PickerView
    var breedData: [String] = [String]()
    var dogData: [String] = ["Any", "Mix", "Maltese", "German Shepherd", "Husky", "French Bulldog", "Labrador", "Corgi"]
    var catData: [String] = ["Any", "Mix", "Persian", "Russian Blue", "Bengal", "Siamese", "Sphynx"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.breedPicker.delegate = self
        self.breedPicker.dataSource = self
        
        breedData = dogData
    }
    
    // Segmented Control - DOG/CAT
    @IBAction func didChangeSegmentedControlValue(_ sender: UISegmentedControl) {
        switch(sender.selectedSegmentIndex) {
        case 0:
            breedData = dogData
            breedPicker.reloadAllComponents()
        case 1:
            breedData = catData
            breedPicker.reloadAllComponents()
        default:
            breedData = dogData
            breedPicker.reloadAllComponents()
        }
    }
    
    // Buttons - goodWithKids, goodWithAnimals, houseTrained
    @IBOutlet weak var goodWithKids: UIButton!
    @IBOutlet weak var goodWithAnimals: UIButton!
    @IBOutlet weak var toiletTrained: UIButton!
    @IBAction func didClickGoodWithKids(_ sender: Any) {
        // Setting the checkbox and values
        if (goodWithKidsBool) {
            goodWithKids.setImage(UIImage(systemName: "square"), for: .normal)
            goodWithKidsBool = false
        } else {
            goodWithKids.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            goodWithKidsBool = true
        }
    }
    
    
    @IBAction func didClickGoodWithAnimals(_ sender: Any) {
        // Setting the checkbox and values
        if (goodWithAnimalsBool) {
            goodWithAnimals.setImage(UIImage(systemName: "square"), for: .normal)
            goodWithAnimalsBool = false
        } else {
            goodWithAnimals.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            goodWithAnimalsBool = true
        }
    }
    
    
    @IBAction func didClickToiletTrained(_ sender: Any) {
        // Setting the checkbox and values
        if (houseTrainedBool) {
            toiletTrained.setImage(UIImage(systemName: "square"), for: .normal)
            houseTrainedBool = false
        } else {
            toiletTrained.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            houseTrainedBool = true
        }
    }
    
    // columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // the number of rows in picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return breedData.count
    }
    
    // passing in the data into the picker view
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return breedData[row]
    }

    // SEARCH BUTTON
    @IBOutlet weak var searchWithFiltersButton: UIButton!
    
    @IBAction func didClickSearchWithFiltersButton(_ sender: Any) {
        // Set all the filters based on what the user selected
        DataManager.shared.setFilter(type: animalSegmentedControl.selectedSegmentIndex, breed:  breedData[breedPicker.selectedRow(inComponent: 0)], goodWithKids: goodWithKidsBool, goodWithAnimals: goodWithAnimalsBool, houseTrained: houseTrainedBool)
    }
    
    // BROWSE BUTTON
    @IBOutlet weak var browseWithoutFiltersButton: UIButton!
    
    
    @IBAction func didClickBrowseWithoutFiltersButton(_ sender: Any) {
    }
    

}
