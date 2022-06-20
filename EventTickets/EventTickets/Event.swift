//
//  Event.swift
//  EventTickets
//
//  Created by Eslam Shaker on 20/06/2022.
//

import Foundation

struct Event: Decodable {
    let id: String
    let city: String
    let artist: String
    let price: Int
}
