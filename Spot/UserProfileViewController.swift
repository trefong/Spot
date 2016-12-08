//
//  UserProfileViewController.swift
//  Spot
//
//  Created by Traci Fong on 10/24/16.
//  Copyright © 2016 Traci Fong. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class UserProfileViewController: UIViewController {
    
    @IBOutlet weak var UserName: UILabel!

    
    override func viewDidLoad(){
        super.viewDidLoad()
        print("LOADED PROFILE PAGE")
        print(FIRAuth.auth()?.currentUser?.uid)
        checkIfUserIsLoggedIn()
    }
    
    func checkIfUserIsLoggedIn() {
        if (FIRAuth.auth()?.currentUser?.uid == nil) {
            
            try! FIRAuth.auth()?.signOut()
            print("THERE IS NO USER")
            
        }else {
            
            print("GOT TO METHOD")
            
            let uid = FIRAuth.auth()?.currentUser?.uid
            FIRDatabase.database().reference().child("users").child(uid!).observe(.value, with: {(snapshot) in
                if let dictionary = snapshot.value as? [String: AnyObject]{
                    self.UserName.text = dictionary["name"] as? String
                }
                
                }, withCancel: nil)
            
        }
        
        
        
    }
    
    @IBAction func logoutAction(_ sender: AnyObject) {
        do {
            try FIRAuth.auth()?.signOut()
        }catch let logoutError {
            print(logoutError)
        }
    }
    
    
}
