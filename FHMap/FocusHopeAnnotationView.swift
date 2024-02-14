//
//  FocusHopeAnnotationView.swift
//  FHMap
//
//  Created by Anna Zvereva on 2/1/24.
//

import SwiftUI

struct FocusHopeAnnotationView: View {
    var body: some View {
        ZStack {
            Image("pinFocusHope")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width * 0.06)
        }
    }
}

#Preview {
    FocusHopeAnnotationView()
}
