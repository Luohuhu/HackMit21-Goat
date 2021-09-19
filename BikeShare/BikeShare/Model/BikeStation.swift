//
//  BikeStation.swift
//  BikeShare
//
//  Created by 罗贤甫 on 9/19/21.
//

import Foundation
import MapKit
struct BikeStation: Identifiable {
    let id = UUID()
    let name: String
    let free_bike: Int
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
