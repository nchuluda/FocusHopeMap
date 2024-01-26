//
//  Recipient.swift
//  FHMap
//
//  Created by Nathan on 1/21/24.
//

import Foundation

class Recipient {
    var firstName: String = ""
    var lastName: String = ""
    var address: String = ""
    var city: String = ""
    var state: String = ""
    var zip: String = ""
    var query: String
    
    init(firstName: String, lastName: String, address: String, city: String, state: String, zip: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.city = city
        self.state = state
        self.zip = zip
        self.query = "\(address), \(city), \(state), \(zip)"
    }
    
}
