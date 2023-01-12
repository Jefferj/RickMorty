//
//  RMCharacterViewController.swift
//  RickMorty
//
//  Created by Jefferson Naranjo rodríguez on 11/01/23.
//

import UIKit

final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        RMService.shared.execute(.listCharactersRequest, expecting: RMGetCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print(String(describing: model))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
