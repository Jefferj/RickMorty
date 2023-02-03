//
//  RMGetAllLocationsResponse.swift
//  RickMorty
//
//  Created by Jefferson Naranjo rodríguez on 3/02/23.
//

import Foundation

struct RMGetAllLocationsResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }

    let info: Info
    let results: [RMLocation]
}
