//
//  LoginView.swift
//  FHMap
//
//  Created by Nathan on 1/30/24.
//

import SwiftUI

struct LoginView: View {
    @State private var user = ""
    @State private var pass = ""
    
    @Binding var showLoginForm: Bool
    @State var showJoinUsForm = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.fhRed, Color.fhWhite, Color.fhRed]),  startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    Image(.fhBlackLogo)
                        .resizable()
                        .scaledToFit()
                        .padding(geo.size.width/6)
                    
                    Spacer()
                    Image(.WELCOME)
                        .resizable()
                        .scaledToFit()
                        .padding(geo.size.width/4)
                    
                    Spacer()
                    HStack {
                        Text("Please LogIn")
                        Spacer()
                    }
                    .padding(.horizontal, geo.size.width/4)
                    
                    VStack(alignment: .center) {
                        TextField("Username", text: $user)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.loginFormText)
                            .textFieldStyle(.roundedBorder)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.horizontal, geo.size.width/4)
                        SecureField("Password", text: $pass)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .textFieldStyle(.roundedBorder)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding([.leading, .trailing], geo.size.width/4)
                        HStack {
                            Button("Forgot Password") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                            Text(" / ")
                            Button("Username") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                        }
                        Button {
                            showLoginForm = false
                        } label: {
                            Text("LOGIN")
                                .font(.headline)
                                .foregroundColor(.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .frame(width: 100, height: 48)
                                .background(.black)
                                .cornerRadius(12)
                                .padding(.bottom,50)
                        Button {
                            showJoinUsForm = true
                        } label: {
                            Text("JOIN US")
                                .font(.headline)
                                .foregroundColor(.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .frame(width: 100, height: 48)
                                .background(.black)
                                .cornerRadius(12)
                                .padding(.bottom,50)
                            }
                        }
                    }
                }
            }
            .sheet(isPresented: $showJoinUsForm, content: {
                JoinUsView(showJoinUsForm: $showJoinUsForm)
            })
        }
       
    }
}
        
        
#Preview {
//    struct ContentView_Previews: PreviewProvider {
//        static var previews: some View {
    LoginView(showLoginForm: .constant(true))
//        }
//    }
}
        
