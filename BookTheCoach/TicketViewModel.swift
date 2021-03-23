//
//  TicketViewModel.swift
//  BookTheCoach
//
//  Created by Thanh Duy on 15/03/2021.
//

import Foundation
import FirebaseFirestore

class TicketViewModel: ObservableObject {
    @Published var ticket = [TicketModel]()
    func fetchInfoId(email: String) {
        Firestore.firestore().collection("infoid").whereField("email", isEqualTo: email)
            .addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("error \(error!.localizedDescription)")
                return
            }
            
            DispatchQueue.main.async {
                self.ticket = documents.map { (queryDocumentSnapshot) -> TicketModel in
                    let data = queryDocumentSnapshot.data()
                    
                    let day = data["day"] as? String ?? ""
                    let email = data["email"] as? String ?? ""
                    let sdt = data["sdt"] as? String ?? ""
                    let time = data["time"] as? String ?? ""
                    let selectedseat = data["selectedseat"] as? [Int] ?? []
                    let name = data["name"] as? String ?? ""
                    let inforid = data["inforid"] as? String ?? ""
                    let route = data["route"] as? String ?? ""
                    let rid = data["rid"] as? String ?? ""
                    
                    return TicketModel(route: route, inforid: inforid, day: day, email: email, name: name, sdt: sdt, selectedseat: selectedseat, time: time, rid: rid)
                }
            }
        }
    }
}
