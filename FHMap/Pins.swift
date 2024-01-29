//
//  Pins.swift
//  FHMap
//
//  Created by Nathan on 1/21/24.
//

import Foundation
import CoreLocation

class Pin: Identifiable, Encodable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var address: String
    var city: String
    var state: String
    var zip: String
    var phone: String
    var latitude: Double
    var longitude: Double
//    var coordinates: CLLocationCoordinate2D
    
    init(firstName: String, lastName: String, address: String, city: String, state: String, zip: String, phone: String, latitude: Double, longitude: Double) {
//    init(name: String, city: String, state: String, zip: String, latitude: Double, longitude: Double) {
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.city = city
        self.state = state
        self.zip = zip
        self.phone = phone
        self.latitude = latitude
        self.longitude = longitude
//        self.coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
