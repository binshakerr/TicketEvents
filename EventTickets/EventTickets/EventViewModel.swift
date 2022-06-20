//
//  EventViewModel.swift
//  EventTickets
//
//  Created by Eslam Shaker on 20/06/2022.
//

import Foundation
import Combine

final class EventViewModel: ObservableObject {
    
    @Published var events: [Event] = []
    
    
    func loadEvents() {
        do {
            events = try JsonReader.shared.load(fileName: "EventList", type: [Event].self)
            print(events)
        } catch {
            print(error)
        }
    }
}
