//
//  RMSettingViewController.swift
//  RickMorty
//
//  Created by Jefferson Naranjo rodríguez on 11/01/23.
//

import UIKit

final class RMSettingViewController: UIViewController {
    
    private let viewModel = RMSettingsViewViewModel(cellViewModels: RMSettingsOption.allCases.compactMap({
        return RMSettingsCellViewModel(type: $0)
    }))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Settings"
    }
}
