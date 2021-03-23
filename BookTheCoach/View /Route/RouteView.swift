//
//  RouteView.swift
//  BookTheCoach
//
//  Created by Thanh Duy on 11/03/2021.
//

import SwiftUI

struct RouteView: View {
    @ObservedObject var routes = RouteViewModel()
    var body: some View {
        NavigationView {
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
            .onAppear() {
                self.routes.fetchData()
            }
            .navigationTitle("Tuyen xe")
            
        }
        
    }
}

struct RouteView_Previews: PreviewProvider {
    static var routes = RouteViewModel()
    static var previews: some View {
        RouteView()
    }
}
