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
    
    static func previewRoute() -> [Box] {
        let place = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 42.35993330, longitude: -83.00728570))
        let item = MKMapItem(placemark: place)
        item.name = "Fake Name"
        item.timeZone = TimeZone(identifier: "EST")
        return [Box(item: item, firstName: "First", lastName: "Last", phone: "Phone"), Box(item: item, firstName: "First", lastName: "Last", phone: "Phone"), Box(item: item, firstName: "First", lastName: "Last", phone: "Phone")]
    }
    
//    init(firstName: String, lastName: String, phone: String, mapItem: MKMapItem) {
    init(item: MKMapItem, firstName: String, lastName: String, phone: String) {

        self.item = item
        self.firstName = firstName
        self.lastName = lastName
        self.phone = phone
//        self.mapItem = mapItem
    }
}
