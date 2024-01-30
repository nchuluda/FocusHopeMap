//
//  AddBoxFormView.swift
//  FHMap
//
//  Created by Nathan on 1/29/24.
//

import SwiftUI
import CoreLocation
import MapKit

struct AddBoxFormView: View {
    @Binding var showAddBoxForm: Bool
    @ObservedObject var pinsModel: PinsModel
    @Binding var boxes: [Box]
    
    @State var firstName = ""
    @State var lastName = ""
    @State var address = ""
    @State var city = ""
    @State var state = ""
    @State var zip = ""
    @State var phone = ""
    var latitude = 0.0
    var longitude = 0.0
    
    var query: String {
        return "\(address), \(city), \(state), \(zip)"
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                }
                Section(header: Text("Address")) {
                    TextField("Address", text: $address)
                    TextField("City", text: $city)
                    TextField("State", text: $state)
                    TextField("Zip", text: $zip)
                    TextField("Phone", text: $phone)
                }
                Section(header: Text("Submit")) {
                    Button("Submit") {
                        print(firstName + " " + lastName + " " + address + " " + city + " " + state + " " + zip + " " + phone)
                        pinsModel.getCoordinate(addressString: query) { coordinate, error in
                            print("\(coordinate.latitude), \(coordinate.longitude)")
                            let box = pinsModel.buildBox(coordinate: coordinate, address: address, firstName: firstName, lastName: lastName, phone: phone)
                            boxes.append(box)
                        }
                        showAddBoxForm = false
                    }
                }
            }
        }
    }
}

//#Preview {
//    AddBoxFormView(showAddBoxForm:.constant(false), pinsModel: PinsModel())
//}

//extension AddBoxFormView {
//    func getCoordinate(addressString: String, completionHandler: @escaping(CLLocationCoordinate2D, NSError?) -> Void) {
//        let geocoder = CLGeocoder()
//        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
//            if error == nil {
//                if let placemark = placemarks?[0] {
//                    let location = placemark.location!
//                    
//                    completionHandler(location.coordinate, nil)
//                    return
//                }
//            }
//            completionHandler(kCLLocationCoordinate2DInvalid, error as NSError?)
//        }
//    }
    
//    func buildPinsFromAddresses() {
//        focusHope.forEach { address in
//            getCoordinate(addressString: address) { coordinate, error in
//                self.pins.append(Pin(name: address, latitude: coordinate.latitude, longitude: coordinate.longitude))
//                print("Pin(name: \"\(address)\", latitude: \(coordinate.latitude), longitude: \(coordinate.longitude)),")
//            }
//        }
//    }
    
//}
