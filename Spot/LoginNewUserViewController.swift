//
//  LoginNewUserViewController.swift
//  Spot
//
//  Created by Traci Fong on 10/24/16.
//  Copyright © 2016 Traci Fong. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class LoginNewUserViewController: UIViewController {
    
    @IBOutlet weak var emailfield: UITextField!
    @IBOutlet weak var passwordfield: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
                
    }
    
    
    @IBAction func loginAction(_ sender: AnyObject) {
        if self.emailfield.text == "" || self.passwordfield.text == "" {
            
            let alertController = UIAlertController(title: "Oops!", message: "Please enter an email address and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        }
        else {
            FIRAuth.auth()?.signIn(withEmail: self.emailfield.text!, password: self.passwordfield.text!, completion: {(user, error) in
                
                if error == nil {
                    print("LOGIN COMPLETE")
                    
                }else {
                    print("LOGIN ERROR")
                    let alertController = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    
                    
                }
                
            })
        }

    }
    
    
    
    
    
}
