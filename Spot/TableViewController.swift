//
//  ViewController.swift
//  Spot
//
//  Created by Traci Fong on 10/18/16.
//  Copyright © 2016 Traci Fong. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var label:String!
    
    var SchoolArray = [School]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SchoolArray = [School(name:"UC Riverside", lat: 33.973866, long: -117.328043), School(name:"UC Davis", lat: 38.538308, long: -121.761637), School(name:"UC San Diego", lat: 32.880660, long: -117.234629), School(name:"UC Santa Barbara", lat: 34.413954, long: -119.849204), School(name: "UC Berkeley", lat: 37.871950, long: -122.258701), School(name:"UC Merced", lat: 37.364159, long: -120.427564), School(name:"UC Los Angeles", lat: 34.068957, long: -118.444967), School(name:"UC Irvine", lat: 36.991377, long: -122.060668), School(name:"UC Santa Cruz", lat: 36.991377, long: -122.060872), School(name:"UC San Francisco", lat: 37.762957, long:-122.457030)]
        
        SchoolArray.sort(by: {$0.name < $1.name})
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.SchoolArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = SchoolArray[indexPath.row].name
        
        return cell
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showDetails") {
            
            let indexPath = tableView.indexPathForSelectedRow!
            
            let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
            
            label = currentCell.textLabel?.text
            
            let destinationVC = segue.destination as! SchoolDetailsViewController
            
            destinationVC.stringLabel = label
            
            destinationVC.SchoolObject = SchoolArray[indexPath.row]
            
            
            
            //this is where I need to put the name and lat and long of the school!!
        }
    }
}

