//
//  RMCharacterDetailViewController.swift
//  RickMorty
//
//  Created by Jefferson Naranjo rodríguez on 19/01/23.
//

import UIKit

final class RMCharacterDetailViewController: UIViewController {
    private let viewModel : RMCharacterDetailViewViewModel
    
    init(viewModel: RMCharacterDetailViewViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title
    }

}
