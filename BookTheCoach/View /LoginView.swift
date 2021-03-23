//
//  LoginView.swift
//  BookTheCoach
//
//  Created by Thanh Duy on 08/03/2021.
//

import SwiftUI

struct LoginView: View {
//    @EnvironmentObject var userInfo: UserInfo
    // cai nay no khong can thiet vi neu nguoi dung moi thi dau can lay thong tin
    // de lay thong tin user cua chung ta
//
//    enum Action {
//        case signUp, resetPW
//    }
    // de kich hoat cai dang nhap or reset
    
    
//    @State private var showSheet = false
//    @State private var action: Action?
    
    var body: some View {
//        SignInWithEmailView(showSheet: $showSheet, action: $action)
//            .sheet(isPresented: $showSheet, content: {
//                if action == .resetPW {
//                    ForgotPasswordView()
//                } else if action == .signUp {
//                    SignUpView()
//
//                }
//            })
        
        SignInWithEmailView()

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
