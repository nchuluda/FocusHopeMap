//
//  ZipCodeView.swift
//  FHMap
//
//  Created by Nathan on 2/12/24.
//

import SwiftUI

struct ZipCodeView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
            .frame(width: 80, height: 40)
            .foregroundColor(.mint)
            .overlay {
                Text("12345")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
    }
}

#Preview {
    ZipCodeView()
}
