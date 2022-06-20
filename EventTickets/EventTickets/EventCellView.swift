//
//  EventCellView.swift
//  EventTickets
//
//  Created by Eslam Shaker on 20/06/2022.
//

import SwiftUI

struct EventCellView: View {
    
    var event: Event
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(event.artist)
                .fontWeight(.semibold)
            Text(event.city)
            Text("\(event.price)$")
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .border(.blue, width: 1)
    }
}

struct EventCellView_Previews: PreviewProvider {
    static var previews: some View {
        let mockEvent = Event(id: "003", city: "Dubai", artist: "Amr Diab", price: 33)
        EventCellView(event: mockEvent)
            .previewLayout(.sizeThatFits)
    }
}
