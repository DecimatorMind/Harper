//
//  RegistrationViewController.swift
//  Harper
//
//  Created by Pranjal Bhardwaj on 14/09/20.
//  Copyright © 2020 Pranjal Bhardwaj. All rights reserved.
//

import UIKit
import Firebase

class DestinationViewController: UIViewController{
    
    @IBOutlet weak var RegistrationEmail: UITextField!
    @IBOutlet weak var RegistrationPassword: UITextField!
    @IBOutlet weak var ConfirmingPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func RegisterUser(_ sender: UIButton) {
        print(RegistrationPassword.text!)
        print(RegistrationEmail.text!)
        print(ConfirmingPassword.text!)
    }
}
