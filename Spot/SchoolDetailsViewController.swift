//
//  SchoolDetailsViewController.swift
//  Spot
//
//  Created by Traci Fong on 10/18/16.
//  Copyright © 2016 Traci Fong. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class SchoolDetailsViewController: UIViewController {
    
    @IBOutlet weak var schoolTitle: UILabel!
    var stringLabel: String = ""
    var SchoolObject:School!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        schoolTitle.text = stringLabel
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showMapView"){
        
        let containerVC = segue.destination as! SchoolHomeMapController
        
        containerVC.SchoolObject = SchoolObject
        }

    }
}
