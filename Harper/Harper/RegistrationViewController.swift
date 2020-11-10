//
//  RegistrationViewController.swift
//  Harper
//
//  Created by Pranjal Bhardwaj on 14/09/20.
//  Copyright © 2020 Pranjal Bhardwaj. All rights reserved.
//

import UIKit
import Firebase

class RegistrationViewController: UIViewController{
    
    @IBOutlet weak var RegistrationEmail: UITextField!
    
    @IBOutlet weak var RegistrationPassword: UITextField!
    
    @IBOutlet weak var ConfirmingPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func RegisterUser(_ sender: UIButton) {
        
        if let email = RegistrationEmail.text{
            
            if let password = RegistrationPassword.text{
                
                if let confirmingpass = ConfirmingPassword.text{
                    
                    if password == confirmingpass{
                        
                        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                          
                            if(error == nil){
                            
                                self.performSegue(withIdentifier: "RegistrationToMainActivity", sender: nil)
                            
                            } else {
                            
                                self.showToast(message: "Reg. Failed", font: .systemFont(ofSize: 17.0))
                                
                                print(error!)
                            
                            }
                        }
                    }
                }
            }
        }
    }
    
    func showToast(message : String, font: UIFont) {

        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        toastLabel.textColor = UIColor.white
        
        toastLabel.font = font
        
        toastLabel.textAlignment = .center;
        
        toastLabel.text = message
        
        toastLabel.alpha = 1.0
        
        toastLabel.layer.cornerRadius = 10;
        
        toastLabel.clipsToBounds  =  true
        
        self.view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            
             toastLabel.alpha = 0.0
            
        }, completion: {(isCompleted) in
            
            toastLabel.removeFromSuperview()
            
        })
    }
}
