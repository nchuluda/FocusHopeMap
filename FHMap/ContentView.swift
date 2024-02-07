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
    
<<<<<<< Updated upstream
    @State private var showSettings = false
    @State private var showFilter = false
    @State private var downloadClients = false
=======
    @State private var showLoginForm = true
>>>>>>> Stashed changes
    
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
          // Marker("Focus Hope", monogram: Text("FH"), coordinate: CLLocationCoordinate2D(latitude: 42.3996389, longitude: -83.1236609))
          //      .tint(.yellow)
            
            // BOXES - PROFILE DATA AND MAPITEM BUNDLED TOGETHER AS ONE OBJECT
            ForEach(boxes, id: \.item) { box in
                let item = box.item
                Annotation("Focus Hope", coordinate: CLLocationCoordinate2D(latitude: 42.3996389, longitude: -83.1236609)) {
                    FocusHopeAnnotationView()
                }
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
        .sheet(isPresented: $showLoginForm, content: {
            LoginView()
        })
        .onAppear() {
        pinsModel.buildBoxes()
        boxes = pinsModel.boxes
        }
//        .onChange(of: showAddBoxForm) {
//            
//        }
        .overlay(alignment: .top) {
            HStack(alignment: .top) {
                Spacer()
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
                    Spacer()
                    VStack {
                         Button {
                             showSettings = true
                         }
                     label: {
                         Image(systemName: "gearshape")
                             .foregroundColor(.black)
                             .font(.largeTitle .bold())
                             .imageScale(.medium)
                         
                     }
                     .sheet(isPresented: $showSettings) {
                         SettingsView()
                     }.padding(.bottom, 8)
                         
                         Button {
                             showFilter = true
                         }
                     label: {
                         Image(systemName: "list.bullet")
                             .foregroundColor(.black)
                             .font(.largeTitle .bold())
                             .imageScale(.medium)
                     }.sheet(isPresented: $showFilter) {
                         Text("bla la la")
                             .font(.headline)
                             .padding()
                     }
                          
                         Button {
                             downloadClients = true
                         }
                     label: {
                         Image(systemName: "square.and.arrow.down.on.square")
                             .foregroundColor(.black)
                             .font(.largeTitle .bold())
                             .imageScale(.medium)
                         
                     }.padding(.top, 1)

                         
                     }
                     .padding(8)
                                     .background(Color.gray)
                                     .opacity(0.85)
                                     .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                                     .padding(.trailing, UIScreen.main.bounds.width * 0.015)
 //                    .background(Color.blue)
                    
                }
            } .padding(1) //end HStack
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
