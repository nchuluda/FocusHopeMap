////
////  AddPinView.swift
////  FHMap
////
////  Created by Nathan on 1/22/24.
////
//
//import SwiftUI
//import MapKit
//
//struct AddPinView: View {
//    @State private var cameraPosition: MapCameraPosition = .region(.userRegion)
////    @State private var results = [MKMapItem]()
//    @State private var mapSelection: MKMapItem?
//    @State private var showDetails = false
//    @State private var getDirections = false
//    @State private var addBoxText = ""
//    @State private var boxes = [Box]()
//
//    var body: some View {
//        Map(position: $cameraPosition, selection: $mapSelection) {
//            ForEach(boxes) { box in
//                Marker(box.name, systemImage: "shippingbox", coordinate: box.coordinates)
//            }
//        }
//        // TEXT FIELD FOR ADDING ADDRESS AS A PIN ON MAP
//        .overlay(alignment: .top) {
//            TextField("Add an address as a pin...", text: $addBoxText)
//                .font(.subheadline)
//                .padding(12)
//                .background(.white)
//                .padding()
//                .shadow(radius: 10)
//        }
//        .onSubmit(of: .text) {
//            Task { getCoordinate(addressString: addBoxText) { coordinate, error in
//                boxes.append(Box(name: addBoxText, latitude: coordinate.latitude, longitude: coordinate.longitude))
//                }
//            }
//        }
//        .sheet(isPresented: $showDetails, content: {
//            LocationDetailsView(mapSelection: $mapSelection,
//                                show: $showDetails,
//                                getDirections: $getDirections)
//                .presentationDetents([.height(340)])
//                .presentationBackgroundInteraction(.enabled(upThrough: .height(340)))
//                .presentationCornerRadius(12)
//        })
////        .mapControls {
////            MapCompass()
////            MapPitchToggle()
////            MapUserLocationButton()
////        }
////        .sheet(isPresented: $showAddPin, content: {
////            
////        })
////        .onChange(of: mapSelection, { oldValue, newValue in
////            showDetails = newValue != nil
////        })
//    }
//}
//
//extension AddPinView {
//    func getCoordinate(addressString: String,
//                       completionHandler: @escaping(CLLocationCoordinate2D, NSError?) -> Void ) {
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
//}
//
//#Preview {
//    AddPinView()
//}
