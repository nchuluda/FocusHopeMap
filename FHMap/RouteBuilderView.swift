//
//  RouteBuilderView.swift
//  FHMap
//
//  Created by Nathan on 1/30/24.
//

import SwiftUI

struct RouteBuilderView: View {
    @Binding var route: [Box]
    @Binding var showRouteBuilder: Bool
    
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
        }
        ForEach(route, id: \.item) { box in
            VStack {
                Text("\(box.firstName) \(box.lastName)")
                Text("\(box.item.name ?? "Address")")
                Text("\(box.phone)")
            }
            .padding()
        }
    }
}

//#Preview {
//    RouteBuilderView(route: .constant([Box])
//}
