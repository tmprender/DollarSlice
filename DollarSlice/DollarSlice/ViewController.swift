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
        
        let fixedCoordinate = CLLocationCoordinate2D(latitude: 40.7352, longitude: -73.989)
        let dollarslice = PizzaSpot(title:"$1", location: "NYC", coordinate: fixedCoordinate )
        
        allSpots.append(dollarslice)
        
        mapView.addAnnotations(allSpots)
        
        //NOT DISPLAYING
        
//       let alert = UIAlertController(title: "Welcome!", message: "Find $1 Slice", preferredStyle: .alert)
//        
//         alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//        
//        self.present(alert, animated: true, completion:nil)
//        
//        mapView.delegate = self
    }
    
    @IBAction func didAddButton(_ sender: UIButton) {
 
        //change to actually get USER coordinate from locMan
        let userCoordinate = CLLocationCoordinate2D(latitude: 40.7252, longitude: -73.999)
        
        //PROMPT FOR USER INPUT WITH FIELD
        var inputTextField: UITextField?
        
        let popup = UIAlertController(title: "Add a new spot", message: "", preferredStyle:.alert)
        
        popup.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,
            handler: {(action)-> Void in
            //what happens when OK is pressed
            let text = inputTextField?.text
            let spot = PizzaSpot(title: text!, location: "Closeby", coordinate: userCoordinate)
            self.allSpots.append(spot)
            self.mapView.addAnnotations(self.allSpots)
        
        }))
        popup.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler:nil))
        
        
        popup.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Name:"
            inputTextField = textField
        })
        
        self.present(popup, animated:true, completion:nil)
        
    
    }
    //crashes app, need to implement
    @IBAction func didHelpButton(_ sender: UIButton) {
        let listing = allSpots[1].title! //FIX THIS FOR DEBUGGING
        let info = UIAlertController(title: "info", message: listing, preferredStyle: .alert)
        self.present(info, animated: true, completion: nil)
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
    let regionRadius:CLLocationDistance = 3000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated:true)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

