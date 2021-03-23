//
//  TicketModel.swift
//  BookTheCoach
//
//  Created by Thanh Duy on 15/03/2021.
//

import Foundation

struct TicketModel: Hashable {
    var route: String
    var inforid: String
    var day: String
    var email: String
    var name: String
    var sdt: String
    var selectedseat: [Int]
    var time: String
    var rid: String
}
