//
//  BookingViewModel.swift
//  BookTheCoach
//
//  Created by Thanh Duy on 12/03/2021.
//

import Foundation
import FirebaseFirestore


class BookingViewModel: ObservableObject {
    func postBookedSeats(rid: String, bookedseat: [Int]) {
        
        let db = Firestore.firestore()
        
        let bookingRef = db.collection("routes").document("\(rid)")
        
        bookingRef.updateData([
            "bookedseats": FieldValue.arrayUnion(bookedseat),
//            "lastUpdated": FieldValue.serverTimestamp(),
        ]) { (error) in
            if let error = error {
                print("error = \(error.localizedDescription)")
            } else {
                print("data upload successful")
            }
            
        }
        
        
    }
    func postInfoid(day: String, email: String, name: String, sdt: String, selectedseat: [Int], time: String, route: String, rid: String) {
        
        
        let db = Firestore.firestore()
        let inforid = UUID().uuidString
        
        let userinfoRef = db.collection("infoid").document("\(inforid)")
        
        userinfoRef.setData([
            "day": day,
            "email": email,
            "name": name,
            "sdt": sdt,
            "selectedseat": selectedseat,
            "time": time,
//            "lastUpdated": FieldValue.serverTimestamp(),
            "rid": rid,
            "inforid": inforid,
            "route": route
            
        ]) { (error) in
            if let error = error {
                print("error = \(error)")
            } else {
                print("data upload successful")
            }
        }
    }
}

