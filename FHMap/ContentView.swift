//
//  ContentView.swift
//  MHMap
//
//  Created by Nathan on 1/20/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var cameraPosition: MapCameraPosition = .region(.userRegion)
    
    var selectedBox: Binding<Box?> {
        Binding {
            boxes.first { box in
                box.item == mapSelection
            }
        } set: { newValue in
            mapSelection = newValue?.item
        }
    }
    
    @State private var mapSelection: MKMapItem?
//    @State private var mapSelection: String?

    var showDetails: Binding<Bool> {
        Binding {
            mapSelection != nil
        } set: { _ in
            mapSelection = nil
        }

    }
//    @State private var showAdd = false
    @State private var getDirections = false
    @StateObject var pinsModel = PinsModel()
    
    @State private var mapItems = [MKMapItem]()
    @State private var boxes = [Box]()
    
    @State private var firstName: String?
    @State private var lastName: String?
    @State private var phone: String?

    
    var body: some View {
        Map(position: $cameraPosition, selection: $mapSelection) {
            // PIN - FOCUS HOPE VOLUNTEER OFFICE
            Marker("Focus Hope", monogram: Text("FH"), coordinate: CLLocationCoordinate2D(latitude: 42.3996389, longitude: -83.1236609))
                .tint(.yellow)
            
            // PINS - CLIENTS WAITING FOR DELIVERY
//            ForEach(pinsModel.samplePins, id: \.id) { item in
//            ForEach(mapItems, id: \.self) { item in
//                Marker(item.name ?? "Box", systemImage: "shippingbox", coordinate: CLLocationCoordinate2D(latitude: item.placemark.coordinate.latitude, longitude: item.placemark.coordinate.longitude))
//            }
            
            
            // BOXES - profile data and map item bundled together
            ForEach(boxes, id: \.item) { box in
                let item = box.item
                Marker(item.name ?? "Box", systemImage: "shippingbox", coordinate: CLLocationCoordinate2D(latitude: item.placemark.coordinate.latitude, longitude: item.placemark.coordinate.longitude))
//                    .tag(box.id.hashValue)
            }
        }
//        .onChange(of: mapSelection, { oldValue, newValue in
//            showDetails = newValue != nil
//        })
        .sheet(isPresented: showDetails, content: {
//            LocationDetailsView(mapSelection: $mapSelection,
//                                show: $showDetails,
//                                getDirections: $getDirections)
//            LocationDetailsView(selectedBox: selectedBox,
//                                show: showDetails,
//                                getDirections: $getDirections)
            LocationDetailsView(selectedBox: selectedBox)
                .presentationDetents([.height(360)])
                .presentationBackgroundInteraction(.enabled(upThrough: .height(360)))
                .presentationCornerRadius(12)
        })
        .onAppear() {
//            pinsModel.buildPinsFromAddresses()
//        pinsModel.buildMapItems()
//        mapItems = pinsModel.mapItems
            
        pinsModel.buildBoxes()
        boxes = pinsModel.boxes
        }
//        .overlay(alignment: .top) {
//            Button {
////                pinsModel.buildPinsFromAddresses()
////                pinsModel.buildMapItems()
////                theMapItems = pinsModel.mapItems
////                pinsModel.countPins()
////                pinsModel.randomPhoneGenerator(areaCode: 313)
////                pinsModel.addNamesToPins()
//            } label: {
//                Text("Create MKMapItems")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .frame(width: 178, height: 48)
//                    .background(.green)
//                    .cornerRadius(12)
//            }
//        }
    }
}

extension CLLocationCoordinate2D {
    static var userLocation: CLLocationCoordinate2D {
        return .init(latitude: 42.393776, longitude: -83.055735)
    }
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        return .init(center: .userLocation,
                     latitudinalMeters: 10000,
                     longitudinalMeters: 10000)
    }
}

#Preview {
    ContentView()
}
