//
//  SchoolHomeMapController.swift
//  Spot
//
//  Created by Traci Fong on 10/20/16.
//  Copyright © 2016 Traci Fong. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class SchoolHomeMapController: UIViewController{
    
    var SchoolObject:School!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initializes Map
        
        self.view.layoutIfNeeded()
        
        let camera = GMSCameraPosition.camera(withLatitude: SchoolObject.lat, longitude: SchoolObject.long, zoom: 15.0)
        
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        mapView.isMyLocationEnabled = true
        
        view = mapView
        
        //Puts a marker in the center of the map
        
        let marker = GMSMarker()
        
        marker.position = CLLocationCoordinate2D(latitude: SchoolObject.lat, longitude: SchoolObject.long)
        
        marker.title = SchoolObject.name
        
        marker.map = mapView
        
        
    }
    
    
}

