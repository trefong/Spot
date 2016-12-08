//
//  SignInNewUserViewController.swift
//  Spot
//
//  Created by Traci Fong on 11/17/16.
//  Copyright © 2016 Traci Fong. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class SignUpNewUserViewController: UIViewController {
    
    @IBOutlet weak var namefield: UITextField!
    @IBOutlet weak var emailfield: UITextField!
    @IBOutlet weak var passwordfield: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func signUpAction(_ sender: AnyObject) {
        
        if self.emailfield.text == "" || self.passwordfield.text == "" {
            
            let alertController = UIAlertController(title: "Oops!", message: "Please enter an email address and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        }
        else {
            
            guard let email = emailfield.text, let name = namefield.text else {
                print("form is not valid")
                return
            }
            
            FIRAuth.auth()?.createUser(withEmail: self.emailfield.text!, password: self.passwordfield.text!, completion: { (user: FIRUser?, error) in
                
                guard let uid = user?.uid else {
                    return
                }
                
                if error == nil {
                    
                    let ref: FIRDatabaseReference!
                    ref = FIRDatabase.database().reference(fromURL: "https://spot-1476918223399.firebaseio.com/")
                    
                    let usersReference = ref.child("users").child(uid)
                    
                    let values = ["name": name, "email": email]
                    print(FIRAuth.auth()?.currentUser?.uid)
                    
                    usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
                        if err != nil{
                            print(err)
                            return
                        }
                        
                    })
                    
                    self.ref.authUser(self.email.text, password: self.password.text, withCompletionBlock: { (error, authData) -> Void in
                        if error != nil{
                            print(error) // print if an error is present
                        } else {
                            print("Successfully logged in new user width UID \(userID!)")
                        }
                    })
                    
                }else {
                    
                    let alertController = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                }
                
                
                
            })
        }
        

    }
   
    
    
    
    
    
    
    
}
