//
//  BookTheCoachApp.swift
//  BookTheCoach
//
//  Created by Thanh Duy on 02/03/2021.
//

import SwiftUI
import Firebase

@main
struct BookTheCoachApp: App {
    var userInfo = UserInfo()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(userInfo)
//            SplashScreen().environmentObject(userInfo)
        }
    }
}


