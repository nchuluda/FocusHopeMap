//
//  PrintView.swift
//  FHMap
//
//  Created by Nathan on 1/31/24.
//

import SwiftUI

struct PrintView: View {
    @Binding var route: [Box]
    
    var body: some View {
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
//    PrintView()
//}
