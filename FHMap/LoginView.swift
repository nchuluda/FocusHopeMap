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
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                //                        Color.fhRed
                LinearGradient(gradient: Gradient(colors: [Color.fhRed, Color.fhWhite, Color.fhRed]),  startPoint: .top, endPoint: .bottom)
                //
                //                        RadialGradient(colors: [Color.fhWhite,  Color.fhRed], center: .center, startRadius: 20, endRadius: 200)
                
                //            AngularGradient(colors: [Color.fhWhite,  Color.fhRed], center: .center, angle: .degrees(320.0))
                //
                    .ignoresSafeArea()
                
                
                //            LinearGradient(stops: [
                //            Gradient.Stop(color:
                //                    .fhRed,1 location:
                //                            0.50),
                ////            Gradient.Stop(color:.fhDarkGray, location:0.50),
                ////            startPoint,: .top, endPoint: .bottom)
                
                
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
                            
                            VStack {
                                Text("Join Us")
                            
                        
                        
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
                            
                            
//                            Button {
//                            ("JOIN US")} 
//                            {
//                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//                                .font(.headline)
//                                .foregroundColor(.white)
//                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                                .frame(width: 100, height: 48)
//                                .background(.black)
//                                .cornerRadius(12)
//                                .padding(.bottom,50)
//                            }
                            }
                        }
                    }
                }
            }
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
        
