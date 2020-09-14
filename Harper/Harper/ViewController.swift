//
//  ViewController.swift
//  Harper
//
//  Created by Pranjal Bhardwaj on 07/09/20.
//  Copyright © 2020 Pranjal Bhardwaj. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var User_email: UITextField!
    @IBOutlet weak var User_password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func User_login(_ sender: UIButton) {
        if let email = User_email.text{
            if let password = User_password.text{
                Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
                    if(error == nil){
                        print("Yes Authentication Successful")
                    } else {
                        print(error!)
                        self.showToast(message: "Auth. Failed", font: .systemFont(ofSize: 17.0))
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
    
    @IBAction func ToRegister(_ sender: UIButton) {
        
    }
    
}

