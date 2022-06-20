//
//  EventsView.swift
//  EventTickets
//
//  Created by Eslam Shaker on 20/06/2022.
//

import SwiftUI

struct EventsView: View {
    
    @ObservedObject var viewModel: EventViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationTitle("Events")
            .onAppear{
                viewModel.loadEvents()
            }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView(viewModel: EventViewModel())
    }
}
