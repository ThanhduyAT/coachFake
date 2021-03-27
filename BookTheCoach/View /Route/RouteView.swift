//
//  RouteView.swift
//  BookTheCoach
//
//  Created by Thanh Duy on 11/03/2021.
//

import SwiftUI

struct RouteView: View {
    @ObservedObject var routes = RouteViewModel()
    @Binding var selectedMenuItem: MenuItem
    var body: some View {
        return NavigationView {
            List(routes.routes, id: \.self) { route in
                let rid = route.rid
                let bookedseat = route.bookedseats
                let time = route.time
                let day = route.day
                let route = route.route
                
                NavigationLink(
                    destination: BookingView(route: route, time: time, day: day, bookedSeat: bookedseat, rid: rid),
                    label: {
                        VStack(alignment: .leading) {
                            Text(route)
                                .font(.headline)
                            
                            HStack {
                                Text("Day: ")
                                    .fontWeight(.bold)
                                
                                Text(day)
                                
                            }
                            
                            HStack {
                                Text("Time: ")
                                    .fontWeight(.bold)
                                
                                Text(time)
                            }
                            
                            HStack {
                                Text("So ghe con trong: ")
                                    .fontWeight(.bold)
                                Text("\(20 - bookedseat.count)")
                            }
                        }
                    })
            }
            .navigationTitle("Tuyen xe")
            
        }
        .onAppear() {
            if MenuItem.ROUTE == selectedMenuItem {
                self.routes.fetchData()
            }
        }

        
    }
}

//struct RouteView_Previews: PreviewProvider {
//    static var routes = RouteViewModel()
//    static var previews: some View {
//        RouteView()
//    }
//}
