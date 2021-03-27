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
    @State var selected: MenuItem = .ROUTE
    
    var body: some View {
        
        return TabView(selection: $selected) {
            RouteView(selectedMenuItem: $selected)
                .tabItem {
                    Image(systemName: "bus.fill")
                    Text("Route")
                }
                .tag(MenuItem.ROUTE)
            
            TicketView(selectedMenuItem: $selected)
                .tabItem {
                    Image(systemName: "note.text")
                    Text("Your ticket")
                }
                .tag(MenuItem.TICKET)
            UserView()
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                    Text("Account")
                }
                .tag(MenuItem.USER)
            
        }
        
        //        .onAppear {
        //            guard let uid = Auth.auth().currentUser?.uid else {
        //                return
        //            }
        //            FBFirestore.retrieveFBUser(uid: uid) { (result) in
        //                switch result {
        //                case .failure(let error):
        //                    print(error.localizedDescription)
        //                    // display some kind of alert to your user
        //                case .success(let user):
        //                    self.userInfo.user = user
        //                }
        //            }
        //        }
    }
}
enum MenuItem {
    case ROUTE, TICKET, WEB, USER
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
