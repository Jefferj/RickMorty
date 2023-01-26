//
//  RMCharacterPhotoCollectionViewCellViewModel.swift
//  RickMorty
//
//  Created by Jefferson Naranjo rodríguez on 26/01/23.
//

import Foundation

class RMCharacterPhotoCollectionViewCellViewModel {
    private let imageUrl : URL?
    
    init(imageUrl: URL?) {
        self.imageUrl = imageUrl
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let imageUrl = imageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        RMImageLoader.shared.downloadImage(imageUrl, completion: completion)

    }
}
