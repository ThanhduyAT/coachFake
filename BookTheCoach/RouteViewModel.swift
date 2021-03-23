//
//  RouteViewModel.swift
//  BookTheCoach
//
//  Created by Thanh Duy on 11/03/2021.
//

import Foundation
import FirebaseFirestore


class RouteViewModel: ObservableObject {
    @Published var routes = [RouteModel]()
    @Published var isLoading = false
    
    let db = Firestore.firestore()
    func fetchData() {
        
        self.isLoading.toggle()
        db.collection("routes").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("error \(error!.localizedDescription)")
                return
            }
            
            DispatchQueue.main.async {
                self.routes = documents.map { (queryDocumentSnapshot) -> RouteModel in
                    let data = queryDocumentSnapshot.data()
                    
                    let rid = data["rid"] as? String ?? ""
                    let route = data["route"] as? String ?? ""
                    let time = data["time"] as? String ?? ""
                    let day = data["day"] as? String ?? ""
                    
                    let bookedseats = data["bookedseats"] as? [Int] ?? []
                    
                    return RouteModel(rid: rid, route: route, day: day, time: time, bookedseats: bookedseats)
                }
            }
        }
        self.isLoading.toggle() 
        
    }
}
