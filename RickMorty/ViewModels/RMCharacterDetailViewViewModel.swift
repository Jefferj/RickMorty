//
//  RMCharacterDetailViewViewModel.swift
//  RickMorty
//
//  Created by Jefferson Naranjo rodríguez on 19/01/23.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
}
