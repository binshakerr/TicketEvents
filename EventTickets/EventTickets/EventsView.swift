//
//  EventsView.swift
//  EventTickets
//
//  Created by Eslam Shaker on 20/06/2022.
//

import SwiftUI

struct EventsView: View {
    
    @ObservedObject var viewModel: EventViewModel
    private let columns = [GridItem(.flexible(minimum: 80), spacing: 10, alignment: .leading)]
    
    var body: some View {
        VStack {
            
            HStack {
                VStack {
                    TextField("City", text: $viewModel.cityFilter)
                        .textFieldStyle(.roundedBorder)
                    TextField("Price", text: $viewModel.priceFilter)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                }
                
                Button {
                    viewModel.filterEvents()
                } label: {
                    Text("Filter")
                }
            }
            
            ScrollView {
                LazyVGrid(columns: columns, alignment: .leading, spacing: 20) {
                    ForEach(viewModel.events, id: \.self) { event in
                        EventCellView(event: event)
                    }
                }
            }
        }
        .padding()
        .navigationTitle("Events")
        .onAppear {
            viewModel.loadEvents()
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView(viewModel: EventViewModel())
    }
}
