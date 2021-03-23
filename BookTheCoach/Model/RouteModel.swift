//
//  RouteModel.swift
//  BookTheCoach
//
//  Created by Thanh Duy on 11/03/2021.
//

import Foundation

struct RouteModel: Identifiable, Hashable {
    var id = UUID()
    var rid: String
    var route: String
    var day: String
    var time: String
    var bookedseats: [Int]
    
}
