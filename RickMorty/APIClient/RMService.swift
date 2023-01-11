//
//  RMService.swift
//  RickMorty
//
//  Created by Jefferson Naranjo rodríguez on 11/01/23.
//

import Foundation

/// Primary API service object to get Rick and Morty data
final class RMService {
    /// Shared singlenton instance
    static let shared = RMService()
    ///Privatized constructor
    private init() {}
    ///Send Rick and Morty API call
    ///-Parameters:
    ///  -request: Request Instance
    ///    -completion:  Callback with data or error
    public func execute(_ request: RMRequest, completion: @escaping () -> Void){
        
    }
}
