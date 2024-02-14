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
    @State private var route = [Box]()
    @State private var zipCodes = [ZipCodePin]()
    
    @State private var showZips = true
    @State private var showAddBoxForm = false
    @State private var showRouteBuilder = false
    
    @State private var showSettings = false
    @State private var showFilter = false
    @State private var downloadClients = false
    @State private var showLoginForm = true
    
    
    
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
            Annotation("Focus Hope", coordinate: CLLocationCoordinate2D(latitude: 42.3996389, longitude: -83.1236609)) {
                FocusHopeAnnotationView()
            }
            
            // ZIP CODES
            if showZips {
                ForEach(zipCodes, id: \.item) { zip in
                    let item = zip.item
                    
                    Annotation(zip.zip, coordinate: CLLocationCoordinate2D(latitude: item.placemark.coordinate.latitude, longitude: item.placemark.coordinate.longitude)) {
                        ZStack {
//                            RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
//                                .frame(width: 75, height: 35)
//                                .foregroundColor(.yellow.opacity(0.5))
//                                .offset(y: 15)
//                                .onTapGesture {
//                                    showZips.toggle()
//                                    boxes = pinsModel.filterBoxesByZip(zip: zip.zip)
//                                }
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .frame(width: 75, height: 35)
                                .foregroundColor(.mint)
                                .overlay {
                                    Text(zip.zip)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .font(.title3)
                                }
                                .onTapGesture {
                                    showZips.toggle()
                                    boxes = pinsModel.filterBoxesByZip(zip: zip.zip)
                                }
                        }
                    }
                    .annotationTitles(.hidden)
                }
            }
            
            // BOXES - PROFILE DATA AND MAPITEM BUNDLED TOGETHER AS ONE OBJECT
            if !showZips {
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
        .fullScreenCover(isPresented: $showLoginForm, content: {
            LoginView(showLoginForm: $showLoginForm)
        })
        .onAppear() {
            pinsModel.buildBoxes()
            boxes = pinsModel.boxes
            
            pinsModel.buildZipCodePins()
            zipCodes = pinsModel.zipCodes
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
                    if !showZips {
                        Button {
                            showZips.toggle()
                            mapSelection = nil
                        } label: {
                            Text("Zip Codes")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 100, height: 48)
                                .background(.mint)
                                .cornerRadius(12)
                        }
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
