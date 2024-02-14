//
//  Zips.swift
//  FHMap
//
//  Created by Nathan on 2/12/24.
//

import Foundation

class Zip: Identifiable, Encodable {
    var zip: String
    var latitude: Double
    var longitude: Double
    
    init(zip: String, latitude: Double, longitude: Double) {
        self.zip = zip
        self.latitude = latitude
        self.longitude = longitude
    }
}
