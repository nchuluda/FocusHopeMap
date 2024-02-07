//
//  RouteBuilderView.swift
//  FHMap
//
//  Created by Nathan on 1/30/24.
//

import SwiftUI
import MapKit
import UIKit

struct RouteBuilderView: View {
    @Binding var route: [Box]
    @Binding var showRouteBuilder: Bool
    @Environment(\.displayScale) var displayScale
    @State private var renderedImage = Image(systemName: "photo")
    let url = URL.documentsDirectory.appending(path: "printout.png")
    
    var body: some View {
        HStack {
            Button {
                route = []
                showRouteBuilder.toggle()
            } label: {
                Text("Clear Route")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 100, height: 48)
                    .background(.red)
                    .cornerRadius(12)
            }
            .padding([.top, .bottom])
        }
//        ShareLink("Export", item: url, preview: SharePreview(Text("Shared image"), image: url))
        ShareLink("Export", item: renderedImage, preview: SharePreview(Text("Shared image"), image: renderedImage))

//        ShareLink("Export", item: url, preview: SharePreview(Text("Volunteer Route")), image: url)
        ScrollView {
            ForEach(route, id: \.item) { box in
                VStack {
                    Text("\(box.firstName) \(box.lastName)")
                    Text("\(box.item.name ?? "Address")")
                    Text("\(box.phone)")
                }
                .padding()
            }
        }
        .onAppear {
            render()
        }
    }
    
    @MainActor func render() {
        let renderer = ImageRenderer(content: PrintView(route: $route))
        renderer.scale = displayScale
        
        if let uiImage = renderer.uiImage {
            
            renderedImage = Image(uiImage: uiImage)
            
//            if let data = uiImage.pngData() {
//                print("data created from pngData()")
//                do {
//                    let data = try uiImage.pngData()
//                    try data.write(to: url, options: .atomic)
//                    print("Woo! .png saved to documents directory")
//                } catch {
//                    print("Error writing .png to documents directory")
//                }
//            }
        }
    }
    
//    public func exportPngUrl(filename: String) throws -> URL {
//            let url = URL.documentsDirectory.appending(path: "\(filename).png")
//
//            let img = self.thoughtGroupView.imageMap()
//
//            guard let data = img.pngData() else {
//                throw SCPThoughtGroupExportError.couldNotGetPngData("PNG data could not be generated from the document")
//            }
//
//            do {
//                try data.write(to: url, options: .atomic)
//                return url
//            }
//        }
}
    
#Preview {
    RouteBuilderView(route: .constant(Box.previewRoute()), showRouteBuilder: .constant(false))
}
