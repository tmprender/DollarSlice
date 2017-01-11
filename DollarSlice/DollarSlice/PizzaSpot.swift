//
//  PizzaSpot.swift
//  DollarSlice
//
//  Created by Thomas Prenderville on 1/10/17.
//  Copyright © 2017 Prenderville.net. All rights reserved.
//

import Foundation
import MapKit

class PizzaSpot: NSObject, MKAnnotation {
    let title: String?
    let location: String
    let coordinate: CLLocationCoordinate2D
//  let rating: Double

    init(title: String, location: String, coordinate: CLLocationCoordinate2D){
        self.title = title
        self.coordinate = coordinate
        self.location = location
//      self.rating = 0
    
        super.init()
    }
    
    var subtitle: String? {
        return location
    }
    
}
