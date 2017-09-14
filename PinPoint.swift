//
//  PinPoint.swift
//  0914DataModel
//
//  Created by D7702_10 on 2017. 9. 14..
//  Copyright © 2017년 D7702_10. All rights reserved.
//

import UIKit
import MapKit

class PinPoint: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}

