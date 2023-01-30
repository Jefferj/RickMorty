//
//  RMEpisodeDetailViewViewModel.swift
//  RickMorty
//
//  Created by Jefferson Naranjo rodríguez on 30/01/23.
//

import UIKit

class RMEpisodeDetailViewViewModel{
    private let endpointUrl: URL?
    
    init(endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
        fetchEpisodeData()
    }
    
    private func fetchEpisodeData() {
        guard let url = endpointUrl,
                let request = RMRequest(url: url) else {
            return
        }
        RMService.shared.execute(request, expecting: RMEpisode.self) { result in
            switch result {
            case .success(let success):
                print("Ehllo")
            case .failure(let failure):
                break
            }
        }
    }
}
