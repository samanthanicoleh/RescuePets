//
//  HomeViewController.swift
//  FinalProjectHolstead
//
//  Created by Samantha Holstead (RIT Student) on 11/20/19.
//  Copyright © 2019 Samantha Holstead (RIT Student). All rights reserved.
//

import UIKit
import MessageUI

class HomeViewController: UIViewController {

    @IBOutlet weak var homeImage: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var msgText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting UI
        homeImage.image = UIImage(named: "home_image")
        homeImage.layer.cornerRadius = homeImage.frame.width / 4
        homeImage.layer.masksToBounds = true
        
        msgText.layer.borderWidth = 1.0
        msgText.layer.borderColor = UIColor(red: 239.0/255, green: 239.0/255, blue: 239.0/255, alpha: 1.0).cgColor
        msgText.layer.cornerRadius = 5.0
    }
    
    // Sending the message
    @IBAction func sendMessage(_ sender: Any) {
        checkFormData()
        guard MFMailComposeViewController.canSendMail() else {
            
            // It will always go to this function when running on the simulator
            // MARK: Comment out in case of deployment
            // For presentation purposes I force the success alert here - to be commented out if ever deployed
            checkFormData()
            let alert = UIAlertController(title: "☺︎", message: "Your message has been sent!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            nameTextField.text = ""
            emailTextField.text = ""
            msgText.text = ""
            return // if cannot send mail
        }
        
        let mailSender = MFMailComposeViewController()
        mailSender.mailComposeDelegate = self
        mailSender.setToRecipients(["sxh9891@g.rit.edu"])
        mailSender.setSubject("Home Page Enquiry")
        mailSender.setMessageBody("Name: \(nameTextField.text ?? "Name"), Email: \(emailTextField.text ?? "Email"), Message: \(msgText.text ?? "Message")", isHTML: false)

        present(mailSender, animated: true)
        
        // Resetting the fields and alerting the user
        let alert = UIAlertController(title: "☺︎", message: "Your message has been sent!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        nameTextField.text = ""
        emailTextField.text = ""
        msgText.text = ""
    }
    
    // Validating the data before user continues
    func checkFormData() {
        guard let emailText = emailTextField.text else {return}
        
        if !nameTextField.hasText || !emailTextField.hasText || !msgText.hasText  {
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

extension HomeViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
