//
//  TicketView.swift
//  BookTheCoach
//
//  Created by Thanh Duy on 12/03/2021.
//

import SwiftUI
import FirebaseFirestore

struct TicketView: View {
    @EnvironmentObject var userInfo: UserInfo
    @ObservedObject var tickets = TicketViewModel()
    @State var showAlert = false
    
    var body: some View {
        NavigationView {
            List(tickets.ticket, id: \.inforid) { ticket in
                let route = ticket.route
                let day = ticket.day
                let time = ticket.time
                let soghe = ticket.selectedseat
                let id = ticket.inforid
                let rid = ticket.rid
                HStack {
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
                            Text("So ghe: ")
                                .fontWeight(.bold)
                            HStack {
                                ForEach(soghe.indices, id: \.self){
                                    Text("\(soghe[$0])  ")
                                }
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        self.showAlert.toggle()
                    }, label: {
                        Text("Cancel")
                            .foregroundColor(.white)
                            .background(Color.red)
                            .padding()

                    })
                    
                }
                .alert(isPresented: $showAlert, content: {
                    Alert(title: Text("Are you sure you want to cancel your ticket?"), message: Text("There is no undo"), primaryButton: .destructive(Text("Delete")) {
                        deleteSeatToInfoid(infoid: id)
                        deleteSeatToRoutes(rid: rid, deleteSelectedSeat: soghe)
                    }, secondaryButton: .cancel()
                    )
                })
                
                
            }
            .navigationTitle("Ticket")
            .onAppear() {
                tickets.fetchInfoId(email: userInfo.user.email)
            }
        }
    }
    func deleteSeatToInfoid(infoid: String) {
        Firestore.firestore().collection("infoid").document("\(infoid)").delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
    func deleteSeatToRoutes(rid: String, deleteSelectedSeat: [Int]) {
        Firestore.firestore().collection("routes").document(rid).updateData([
            "bookedseats": FieldValue.arrayRemove(deleteSelectedSeat)
        ]) { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed deleteSelectedSeat")
            }
            
        }
    }
    
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView()
    }
}
