//
//  MatchViewController.swift
//  FinalProjectHolstead
//
//  Created by Samantha Holstead (RIT Student) on 12/6/19.
//  Copyright © 2019 Samantha Holstead (RIT Student). All rights reserved.
//

import UIKit

class MatchViewController: UIViewController {

    @IBOutlet weak var outdoorsSegment: UISegmentedControl!
    @IBOutlet weak var kidsSegment: UISegmentedControl!
    @IBOutlet weak var petsSegment: UISegmentedControl!
    @IBOutlet weak var extraTimeSegment: UISegmentedControl!
    @IBOutlet weak var trainTime: UISegmentedControl!
    
    @IBOutlet weak var findMatchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad() 
    }
    
    @IBAction func didTapFindYourMatch(_ sender: Any) {
        DataManager.shared.setMatch(likesOutdoors: outdoorsSegment.selectedSegmentIndex, hasKids: kidsSegment.selectedSegmentIndex, hasPets: petsSegment.selectedSegmentIndex, hasExtraTime: extraTimeSegment.selectedSegmentIndex, hasTrainingTime: trainTime.selectedSegmentIndex)
    }
    
}
