//
//  AdoptViewController.swift
//  FinalProjectHolstead
//
//  Created by Samantha Holstead (RIT Student) on 11/29/19.
//  Copyright © 2019 Samantha Holstead (RIT Student). All rights reserved.
//

import UIKit
import MessageUI

class AdoptViewController: UIViewController {
    
    var pet: Pet?

    @IBOutlet weak var petImage: CachableImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var proceedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBAction func didTapProceedButton(_ sender: Any) {
        checkFormData()
        guard MFMailComposeViewController.canSendMail() else {
                return // if cannot send mail
                // It will always go to this function when running on the simulator
            }
            
            let mailSender = MFMailComposeViewController()
            mailSender.mailComposeDelegate = self
            mailSender.setToRecipients(["sxh9891@g.rit.edu"])
            mailSender.setSubject("Adoption Form")
            mailSender.setMessageBody("Name: \(nameTextField.text ?? "Name"), Email: \(emailTextField.text ?? "Email"), Phone: \(phoneTextField.text ?? "Phone Number"), Address: \(addressTextField.text ?? "Address")", isHTML: false)

            present(mailSender, animated: true)
            
            // Resetting the fields
            nameTextField.text = ""
            emailTextField.text = ""
            phoneTextField.text = ""
            addressTextField.text = ""
    }
    
    func checkFormData() {
        guard let emailText = emailTextField.text else {return}
        
        if !nameTextField.hasText || !emailTextField.hasText || !phoneTextField.hasText || !addressTextField.hasText {
            let alert = UIAlertController(title: "☹︎", message: "Please fill in all fields before proceeding!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        if !(emailText.contains("@")) {
            let alert = UIAlertController(title: "☹︎", message: "Please enter a valid email!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
}

extension AdoptViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}


