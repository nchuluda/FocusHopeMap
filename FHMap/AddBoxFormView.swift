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
                        pinsModel.getCoordinate(addressString: query) { coordinate, error in
                            let box = pinsModel.buildBox(coordinate: coordinate, address: address, firstName: firstName, lastName: lastName, phone: phone, zip: zip)
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
//    AddBoxFormView(showAddBoxForm: .constant(true), pinsModel: PinsModel(), boxes: AddBoxFormView(showAddBoxForm: <#T##Binding<Bool>#>, pinsModel: <#T##PinsModel#>, boxes: <#T##Binding<[Box]>#>))
//}


