//
//  UserView.swift
//  BookTheCoach
//
//  Created by Thanh Duy on 12/03/2021.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        NavigationView {
            Button(action: {
                FBAuth.logout { (result) in
                    print("Logged out")
                }
            }, label: {
                Text("Log out")
            })
            .navigationTitle("Account")
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
