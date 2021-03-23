//
//  SignInWithEmailView.swift
//  Signin With Apple
//
//  Created by Stewart Lynch on 2020-03-19.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

struct SignInWithEmailView: View {
    @EnvironmentObject var userInfo: UserInfo
    @State var user: UserViewModel = UserViewModel()
//    @Binding var showSheet: Bool
//    @Binding var action:LoginView.Action?
    
    @State private var showAlert = false
    @State private var authError: EmailAuthError?
    //add
    @State private var showSignUp = false
    @State private var showForgotPW = false
    
    var body: some View {
        VStack {
            TextField("Email Address",
                      text: self.$user.email)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            SecureField("Password", text: $user.password)
            HStack {
                Spacer()
                Button(action: {
//                    action = .resetPW
//                    self.showSheet = true
                    self.showForgotPW = true
                }) {
                    Text("Forgot Password")
                }
                .sheet(isPresented: $showForgotPW, content: {
                    ForgotPasswordView()
                })
            }.padding(.bottom)
            VStack(spacing: 10) {
                Button(action: {
                    FBAuth.authenticate(withEmail: self.user.email, password: self.user.password) { (result) in
                        switch result {
                        case .failure(let error):
                            self.authError = error
                            self.showAlert = true
                            
                        case .success( _):
                            print("Signed in")
                        }
                    }
                }) {
                    Text("Login")
                        .padding(.vertical, 15)
                        .frame(width: 200)
                        .background(Color.green)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .opacity(user.isLogInComplete ? 1 : 0.75)
                    //opacity xac dinh neu nguoi dung chua nhap thi nut mo di 0.75
                }.disabled(!user.isLogInComplete)
                Button(action: {
//                    action = .signUp
//                    self.showSheet = true
                    self.showSignUp = true
                }) {
                    Text("Sign Up")
                        .padding(.vertical, 15)
                        .frame(width: 200)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
                .sheet(isPresented: $showSignUp, content: {
                    SignUpView()
                })
            }
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Login Error"), message: Text(self.authError?.localizedDescription ?? "Unknow error"), dismissButton: .default(Text("OK")) {
                    if self.authError == .incorrectPassword {
                        self.user.password = ""
                    } else {
                        self.user.password = ""
                        self.user.email = ""
                    }
                })
            })
        }
        .padding(.top, 100)
        .frame(width: 300)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        
    }
}

struct SignInWithEmailView_Previews: PreviewProvider {
    static var previews: some View {
//        SignInWithEmailView(showSheet: .constant(false), action: .constant(.signUp))
        SignInWithEmailView()


    }
}
