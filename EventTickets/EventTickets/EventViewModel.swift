//
//  EventViewModel.swift
//  EventTickets
//
//  Created by Eslam Shaker on 20/06/2022.
//

import Foundation
import Combine

final class EventViewModel: ObservableObject {
    
    private var allEvents: [Event] = []
    @Published var events: [Event] = []
    @Published var cityFilter = ""
    @Published var priceFilter = ""
    
    func loadEvents() {
        do {
            allEvents = try JsonReader.shared.load(fileName: "EventList", type: [Event].self)
            events = allEvents
        } catch {
            print(error)
        }
    }
    
    func filterEvents() {
        if cityFilter.isEmpty && priceFilter.isEmpty { // 0 filters -> clear filter
            events = allEvents
        } else if !cityFilter.isEmpty && !priceFilter.isEmpty { // 2 filters -> AND filter
                events = allEvents.filter {
                    $0.city.lowercased().contains(cityFilter.lowercased()) && $0.price <= Int(priceFilter) ?? 0
                }
        } else { // 1 filter -> OR filter
            events = allEvents.filter {
                $0.city.lowercased().contains(cityFilter.lowercased()) || $0.price <= Int(priceFilter) ?? 0
            }
        }
    }
}
