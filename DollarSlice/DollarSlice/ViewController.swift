//
//  ViewController.swift
//  DollarSlice
//
//  Created by Thomas Prenderville on 1/10/17.
//  Copyright © 2017 Prenderville.net. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        // Set initial location to Manhattan
        let initialLocation = CLLocation(latitude: 40.7352, longitude: -73.989)
        
        centerMapOnLocation(location: initialLocation)
        

    }
    // Helper method for centering map
    let regionRadius:CLLocationDistance = 2000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated:true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

