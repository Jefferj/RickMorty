//
//  RMLocationViewViewModel.swift
//  RickMorty
//
//  Created by Jefferson Naranjo rodríguez on 2/02/23.
//

import Foundation

final class RMLocationViewViewModel {
    
    private var locations: [RMLocation] = []
    
    init() {}
    
    public func fetchLocations() {
        RMService.shared.execute(.listLocationRequest, expecting: String.self) { result in
            switch result {
            case .success(let model):
                break
            case .failure(let error):
                break
            }
        }
    }
    
    private var hasMoreResults: Bool {
        return false
    }
}
