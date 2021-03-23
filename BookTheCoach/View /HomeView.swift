//
//  HomeView.swift
//  BookTheCoach
//
//  Created by Thanh Duy on 08/03/2021.
//

import SwiftUI
import Firebase


struct HomeView: View {
    @EnvironmentObject var userInfo: UserInfo
    
    
    var body: some View {
        ZStack {

            TabView() {
                RouteView()
                    .tabItem {
                        Image(systemName: "bus.fill")
                        Text("Route")
                    }

                TicketView()
                    .tabItem {
                        Image(systemName: "note.text")
                        Text("Your ticket")
                    }
                UserView()
                    .tabItem {
                        Image(systemName: "person.crop.circle.fill")
                        Text("Account")
                    }
                
            }
        }
        .onAppear {
            guard let uid = Auth.auth().currentUser?.uid else {
                return
            }
            FBFirestore.retrieveFBUser(uid: uid) { (result) in
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                    // display some kind of alert to your user
                case .success(let user):
                    self.userInfo.user = user
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
