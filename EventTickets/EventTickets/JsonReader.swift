//
//  JsonReader.swift
//  EventTickets
//
//  Created by Eslam Shaker on 20/06/2022.
//

import Foundation

class JsonReader {
    
    enum IOError: Error {
        case pathNotFound
    }

    static let shared = JsonReader()
    private init() {}
    private let bundle = Bundle.main
    
    func load<T: Decodable>(fileName: String) throws -> T {
        guard let path = bundle.url(forResource: fileName, withExtension: nil) else {
            throw IOError.pathNotFound
        }
        let data = try Data(contentsOf: path)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
