//
//  ContentView.swift
//  BookTheCoach
//
//  Created by Thanh Duy on 02/03/2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userInfo: UserInfo
    
    var body: some View {
        
        Group {
        
            if userInfo.isUserAuthenticated == .undefined {
//                Text("Loading...")
                LoadingScreen()
            } else if userInfo.isUserAuthenticated == .signedOut {
                //o tinh trang dang xuat thi vao man hinh dang nhap de dang nhap
                LoginView()
            } else {
                HomeView()
            }
        }
        
        
        .onAppear {
            self.userInfo.configureFirebaseStateDidChange()
        }
        // cai nay de no chay truong xem tinh trang cua user 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
