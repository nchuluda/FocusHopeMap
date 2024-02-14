//
//  ZipCodes.swift
//  FHMap
//
//  Created by Nathan on 2/11/24.
//

import Foundation
import MapKit

struct ZipCodePin: Equatable {
    var item: MKMapItem
    var zip: String
    
    init(item: MKMapItem, zip: String) {
        self.item = item
        self.zip = zip
    }
}
