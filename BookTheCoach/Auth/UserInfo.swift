//
//  UserInfo.swift
//  BookTheCoach
//
//  Created by Thanh Duy on 08/03/2021.
//

import Foundation
import FirebaseAuth
// khai bao de thiet lap authencation change listener

class UserInfo: ObservableObject {
    
    
    enum FBAuthState {
        case undefined, signedOut, signedIn
    }
    @Published var isUserAuthenticated: FBAuthState = .undefined
    
    //tao ra cai func tiep theo muc dich de giam sat nhung thay doi anh huong toi cai app cua chung ta
    
    @Published var user: FBUser = .init(uid: "", name: "", email: "")
    // can khoi tao cai user la rong truoc de khoi tao environmetn cua cung ta sau do thi re
    
    var authStateDidChangeListenerHandle: AuthStateDidChangeListenerHandle?
    func configureFirebaseStateDidChange() {
        authStateDidChangeListenerHandle = Auth.auth().addStateDidChangeListener({ (_, user) in
            guard let _ = user else {
                self.isUserAuthenticated = .signedOut
                return
            }
            self.isUserAuthenticated = .signedIn
            
//            FBFirestore.retrieveFBUser(uid: user.uid) { (result) in
//                switch result {
//                case .failure(let error):
//                    print(error.localizedDescription)
//                case .success(let user):
//                    self.user = user
//                }
//            }
        })
        

    }
    
    
    
    
}
