//
//  SettingsView.swift
//  FHMap
//
//  Created by Anna Zvereva on 2/5/24.
//

import SwiftUI

struct SettingsView: View {
 
        @Environment(\.dismiss) var dismiss
        
        var body: some View {
            
            HStack{
                Text("Settings")
                    .font(.title2)
                    .bold()
                
                Button {
                    dismiss()
                }
            label:
                {
                    Image(systemName: "xmark.circle")
                        .font(.title .bold())
                }
            }
            //.background(.red)
            Spacer()
            
            Text ("Privacy Policy for Focus: Hope")
           
                }
    }


#Preview {
    SettingsView()
}
