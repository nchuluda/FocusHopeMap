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
    var zip: String
    
    static func previewRoute() -> [Box] {
        let place = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 42.35993330, longitude: -83.00728570))
        let item = MKMapItem(placemark: place)
        item.name = "660 Woodward Ave, Detroit, MI, 48226"
        item.timeZone = TimeZone(identifier: "EST")
        return [Box(item: item, firstName: "Aimee", lastName: "Manning", phone: "(313)123-4567", zip: "48207"), Box(item: item, firstName: "Catherine", lastName: "Estes", phone: "(313)765-4321", zip: "48224"), Box(item: item, firstName: "Morgan", lastName: "Cochran", phone: "(313)987-2584", zip: "48203")]
    }
    
    init(item: MKMapItem, firstName: String, lastName: String, phone: String, zip: String) {
        self.item = item
        self.firstName = firstName
        self.lastName = lastName
        self.phone = phone
        self.zip = zip
    }
}
