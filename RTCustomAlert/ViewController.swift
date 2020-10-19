//
//  ViewController.swift
//  RTCustomAlert
//
//  Created by Rohit on 19/10/20.
//

import UIKit

class ViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actionOnSingleButtonAlert(_ sender: Any) {
        let customAlert = RTCustomAlert()
        customAlert.alertTitle = "Thank you"
        customAlert.alertMessage = "Your order successfully done."
        customAlert.alertTag = 1
        customAlert.statusImage = UIImage.init(named: "smiley")
        customAlert.isCancelButtonHidden = true
        customAlert.delegate = self
        customAlert.show()
    }
    @IBAction func actionOnTwoButtonAlert(_ sender: Any) {
        
        let customAlert = RTCustomAlert()
        customAlert.alertTitle = "Logout"
        customAlert.alertMessage = "Do you want to logout?"
        customAlert.alertTag = 2
        customAlert.okButtonTitle = "Yes"
        customAlert.cancelButtonTitle = "No"
        customAlert.statusImage = UIImage.init(named: "logout")
        customAlert.delegate = self
        customAlert.show()
    }
    
}

extension ViewController: RTCustomAlertDelegate {
    func okButtonPressed(_ alert: RTCustomAlert, alertTag: Int) {
        
        if alertTag == 1 {
            print("Single button alert: Ok button pressed")
        } else {
            print("Two button alert: Ok button pressed")
        }
        print(alert.alertTitle)
    }
    
    func cancelButtonPressed(_ alert: RTCustomAlert, alertTag: Int) {
        print("Cancel button pressed")
    }
}
