//
//  UserPostionModel.swift
//  BikeShare
//
//  Created by 罗贤甫 on 9/18/21.
//

import Foundation
import CoreLocation
class UserPositionModel{
    var lat: CLLocationDegrees
    var lon: CLLocationDegrees
    init(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            self.lat = location.coordinate.latitude
            self.lon = location.coordinate.longitude
        }else{
            lat = 51.507222
            lon = -0.1275
        }
    }
}
