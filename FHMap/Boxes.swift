//
//  Boxes.swift
//  FHMap
//
//  Created by Nathan on 1/22/24.
//

import Foundation
import MapKit

struct Box: Equatable {
    var item:  MKMapItem
    var firstName: String
    var lastName: String
    var phone: String
//    var mapItem: MKMapItem
    
//    init(firstName: String, lastName: String, phone: String, mapItem: MKMapItem) {
    init(item: MKMapItem, firstName: String, lastName: String, phone: String) {

        self.item = item
        self.firstName = firstName
        self.lastName = lastName
        self.phone = phone
//        self.mapItem = mapItem
    }
}
