//
//  JoinUsView.swift
//  FHMap
//
//  Created by Marsett Hutchons on 2/7/24.
//

import SwiftUI

struct JoinUsView: View {
    @State var firstname = ""
    @State var lastname = ""
    @State var phone = ""
    @State var user = ""
    @State var pass = ""
    @State var passagain = ""
    @State var userhint = ""
    @State var passhint = ""
    @State var deliveredDate = Date()
    @State var adoptedhouse = false
    @Binding var showJoinUsForm: Bool

    var body: some View {
        NavigationView {
            
            VStack {
                Form {
                    Section(header: Text("Personal Information")) 
                    {
                        TextField("First Name", text: $firstname)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.loginFormText)
                        TextField("Last Name", text: $lastname)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        TextField("Telephone Number", text: $phone)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    Section("You will need this info to log in") 
                    {
                        TextField("User Name", text: $user)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        SecureField("Create Password", text: $pass)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    Section("Please enter the Password Again")
                    {
                        SecureField("Confirm Password", text: $passagain)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    Section("Enter a Hint to help you remember")
                    {
                        TextField("Forgot User Name Hint", text: $userhint)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        TextField("Forgot Password Hint", text: $passhint)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    Section("") {
                        DatePicker("Last Date Delivered", selection: $deliveredDate, displayedComponents: .date)
                        Toggle("Adopted House Delivery", isOn: $adoptedhouse)
                            .toggleStyle(SwitchToggleStyle(tint: .red))
                    }
                    
                }
                .navigationTitle("Create Account")
                Button("Submit") {
                    showJoinUsForm = false
                }
                .font(.headline)
                .foregroundColor(.white)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .frame(width: 100, height: 48)
                .background(.black)
                .cornerRadius(12)
            }
            
        }
        .accentColor(.red)
        
    }
    
}
//            }
       // }
#Preview {
    JoinUsView(showJoinUsForm: .constant(true))
}
    
