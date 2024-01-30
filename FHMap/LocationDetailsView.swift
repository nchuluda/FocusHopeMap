//
//  LocationDetailsView.swift
//  AppStuffMap
//
//  Created by Nathan on 1/20/24.
//

import SwiftUI
import MapKit

struct LocationDetailsView: View {
    @State private var lookAroundScene: MKLookAroundScene?
    @Binding var selectedBox: Box?
    @Binding var route: [Box]
    
    var coord = CLLocationCoordinate2D(latitude: 42.35993330, longitude: -83.00728570)
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text(selectedBox?.firstName ?? "First")
                            .font(.headline)
                            .fontWeight(.semibold)
                        .padding(.top)
                        Text(selectedBox?.lastName ?? "Last")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .padding(.top)
                    }
                    HStack {
                        Text(selectedBox?.item.placemark.name ?? "Address")
                            .font(.subheadline)
                        .fontWeight(.semibold)
                    }
                    Text(selectedBox?.phone ?? "Phone")
                        .font(.subheadline)
                        .fontWeight(.semibold)
//                    Text(mapSelection?.placemark.name ?? "")
//                        .font(.subheadline)
//                        .fontWeight(.semibold)
//                    Text(mapSelection?.placemark.title ?? "")
//                        .font(.footnote)
//                        .foregroundStyle(.gray)
//                        .lineLimit(2)
//                        .padding(.trailing )
                    
                }
                Spacer()
                
                Button {
//                    show.toggle()
                    selectedBox = nil
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.gray, Color(.systemGray6))
                }
            }
            .padding([.horizontal, .top])
            
            if let scene = lookAroundScene {
                LookAroundPreview(initialScene: scene)
                    .frame(height: 200)
                    .cornerRadius(12)
                    .padding()
            } else {
                ContentUnavailableView("No preview available", systemImage: "eye.slash")
            }
            
            HStack(spacing: 24) {
//                Button {
//                    if let item = selectedBox?.item {
//                        item.openInMaps()
//                    }
//                } label: {
//                    Text("Open in Maps")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .frame(width: 178, height: 48)
//                        .background(.green)
//                        .cornerRadius(12)
//                }
                Button {
                    print("Add To Route")
                    if let boxToAdd = selectedBox {
                        route.append(boxToAdd)
                    }
                } label: {
                    Text("Add To Route")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 178, height: 48)
                        .background(.blue)
                        .cornerRadius(12)
                }
                
            }
            .padding(.horizontal)
        }
        .onAppear {
//            fetchLookAroundPreview()
            Task {
                try await lookAroundScene = fetchScene(for: selectedBox?.item.placemark.coordinate ?? coord)
            }
            
        }
        .onChange(of: selectedBox?.item) { oldValue, newValue in
//            fetchLookAroundPreview()
            Task {
                try await lookAroundScene = fetchScene(for: selectedBox?.item.placemark.coordinate ?? coord)
            }
        }
    }
}



extension LocationDetailsView {
//    func fetchLookAroundPreview() {
//        if let item = selectedBox?.item {
//            lookAroundScene = nil
//            Task {
//                let request = MKLookAroundSceneRequest(mapItem: item)
//                lookAroundScene = try? await request.scene
//            }
//        }
//    }
    
    private func fetchScene(for coordinate: CLLocationCoordinate2D) async throws -> MKLookAroundScene? {
        let lookAroundScene = MKLookAroundSceneRequest(coordinate: coordinate)
        return try await lookAroundScene.scene
    }
}

//#Preview {
//    LocationDetailsView(selectedBox: .constant(nil), route: box)
//}
