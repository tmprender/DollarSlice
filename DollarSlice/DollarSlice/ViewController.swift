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
    @IBOutlet weak var topLabel: UILabel!  //replace with app logo

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var didAddButton: UIButton! //name buttons with image
    
    var allSpots = [PizzaSpot]() //array of spots
    
    var locMan = CLLocationManager()
    
    //initialize array of annotations
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        topLabel.text = "Dollar Slice"
        
        
      
        // Set initial location to Manhattan
        let initialLocation = CLLocation(latitude: 40.7352, longitude: -73.989)
        // or set initialLocation to = locMan.startUpdatingLocation()
        centerMapOnLocation(location: initialLocation)
        
        let userCoordinate = CLLocationCoordinate2D(latitude: 40.7352, longitude: -73.989)
        let dollarslice = PizzaSpot(title:"$1", location: "NYC", coordinate: userCoordinate )
        
        allSpots.append(dollarslice)
        
        mapView.addAnnotations(allSpots)
        mapView.delegate = self

    }
    
    @IBAction func didAddButton(_ sender: UIButton) {
 
        //PROMPT FOR USER INPUT WITH FIELD
        
       
        
        //change to actually get USER coordinate from locMan
        let userCoordinate = CLLocationCoordinate2D(latitude: 40.7252, longitude: -73.999)
        
        //Initialize with user data
        let spot = PizzaSpot(title: "Second", location: "Closeby", coordinate: userCoordinate)
      
        allSpots.append(spot)
        mapView.addAnnotations(allSpots) // BAD PRACTICE, PIN SHOULD APPEAR WITHOUT THIS LINE
        mapView.delegate = self
        

    }
    
    func addPizzaSpot(spot: PizzaSpot){
        //get data from user
        //add to JSON or XML
        
    }
    
    //Location Manager
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        manager.stopUpdatingLocation()
        
        let coordinations = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude,longitude: userLocation.coordinate.longitude)
        let span = MKCoordinateSpanMake(0.2,0.2)
        let region = MKCoordinateRegion(center: coordinations, span: span)
        
        mapView.setRegion(region, animated: true)
        
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

