//
//  RTCustomAlert.swift
//  RTCustomAlert
//
//  Created by Rohit on 19/10/20.
//

import UIKit

protocol RTCustomAlertDelegate: class {
    func okButtonPressed(_ alert: RTCustomAlert, alertTag: Int)
    func cancelButtonPressed(_ alert: RTCustomAlert, alertTag: Int)
}
class RTCustomAlert: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var alertView: UIView!
    
    var alertTitle = ""
    var alertMessage = ""
    var okButtonTitle = "Ok"
    var cancelButtonTitle = "Cancel"
    var alertTag = 0
    var statusImage = UIImage.init(named: "smiley")
    var isCancelButtonHidden = false
    
    weak var delegate: RTCustomAlertDelegate?

    init() {
        super.init(nibName: "RTCustomAlert", bundle: Bundle(for: RTCustomAlert.self))
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
        
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAlert()
    }
    
    func show() {
        if #available(iOS 13, *) {
            UIApplication.shared.windows.first?.rootViewController?.present(self, animated: true, completion: nil)
        } else {
            UIApplication.shared.keyWindow?.rootViewController!.present(self, animated: true, completion: nil)
        }
    }
    
    func setupAlert() {
        titleLabel.text = alertTitle
        messageLabel.text = alertMessage
        statusImageView.image = statusImage
        okButton.setTitle(okButtonTitle, for: .normal)
        cancelButton.setTitle(cancelButtonTitle, for: .normal)
        cancelButton.isHidden = isCancelButtonHidden
    }
    @IBAction func actionOnOkButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        delegate?.okButtonPressed(self, alertTag: alertTag)
    }
    @IBAction func actionOnCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        delegate?.cancelButtonPressed(self, alertTag: alertTag)
    }
   
}
