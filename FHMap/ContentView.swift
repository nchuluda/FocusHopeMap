//
//  ContentView.swift
//  MHMap
//
//  Created by Nathan on 1/20/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject var pinsModel = PinsModel()
    @State private var cameraPosition: MapCameraPosition = .region(.userRegion)
    @State private var mapSelection: MKMapItem?
    @State private var boxes = [Box]()
    
    @State private var showAddBoxForm = false
    @State private var showRouteBuilder = false
    
    @State private var route = [Box]()
    
    var selectedBox: Binding<Box?> {
        Binding {
            boxes.first { box in
                box.item == mapSelection
            }
        } set: { newValue in
            mapSelection = newValue?.item
        }
    }
    
    var showDetails: Binding<Bool> {
        Binding {
            mapSelection != nil
        } set: { _ in
            mapSelection = nil
        }
    }
    
    var body: some View {
        Map(position: $cameraPosition, selection: $mapSelection) {
            // PIN - FOCUS HOPE VOLUNTEER OFFICE
            Marker("Focus Hope", monogram: Text("FH"), coordinate: CLLocationCoordinate2D(latitude: 42.3996389, longitude: -83.1236609))
                .tint(.yellow)
            
            // BOXES - PROFILE DATA AND MAPITEM BUNDLED TOGETHER AS ONE OBJECT
            ForEach(boxes, id: \.item) { box in
                let item = box.item
                
                // PINS ADDED TO ROUTE
                if route.contains(box) {
                    Marker(item.name ?? "Box", systemImage: "shippingbox", coordinate: CLLocationCoordinate2D(latitude: item.placemark.coordinate.latitude, longitude: item.placemark.coordinate.longitude))
                        .tint(.blue)
                        
                    
                // ALL REMAINING PINS
                } else {
                    Marker(item.name ?? "Box", systemImage: "shippingbox", coordinate: CLLocationCoordinate2D(latitude: item.placemark.coordinate.latitude, longitude: item.placemark.coordinate.longitude))
                }
            }
        }
        .sheet(isPresented: showDetails, content: {
            LocationDetailsView(selectedBox: selectedBox, route: $route)
                .presentationDetents([.height(360)])
                .presentationBackgroundInteraction(.enabled(upThrough: .height(360)))
                .presentationCornerRadius(12)
        })
        .sheet(isPresented: $showAddBoxForm, content: {
            AddBoxFormView(showAddBoxForm: $showAddBoxForm, pinsModel: pinsModel, boxes: $boxes)
        })
        .sheet(isPresented: $showRouteBuilder, content: {
            RouteBuilderView(route: $route, showRouteBuilder: $showRouteBuilder)
        })
        .onAppear() {
        pinsModel.buildBoxes()
        boxes = pinsModel.boxes
        }
        .onChange(of: showAddBoxForm) {
            
        }
        .overlay(alignment: .top) {
            HStack {
                if mapSelection == nil {
                    Button {
                        showAddBoxForm.toggle()
                    } label: {
                        Text("Add Pin")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 100, height: 48)
                            .background(.green)
                            .cornerRadius(12)
                    }
                    Button {
                        showRouteBuilder.toggle()
                    } label: {
                        Text("Route")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 100, height: 48)
                            .background(.blue)
                            .cornerRadius(12)
                        
                    }
                }
            }
        }
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
