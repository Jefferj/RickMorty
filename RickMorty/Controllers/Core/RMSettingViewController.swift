//
//  RMSettingViewController.swift
//  RickMorty
//
//  Created by Jefferson Naranjo rodríguez on 11/01/23.
//

import SwiftUI
import UIKit

final class RMSettingViewController: UIViewController {
    
    private let settingsSwiftUIController = UIHostingController(rootView:
                                                viewModel: RMSettingsViewViewModel(
                                                    cellViewModels: RMSettingsOption.allCases.compactMap({
                                                        return RMSettingsCellViewModel(type: $0)
                                                    })
                                                )
    )
    )
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Settings"
        addSwiftUIController()
    }
    
    private func addSwiftUIController() {
        addChild(settingsSwiftUIController)
        settingsSwiftUIController.didMove(toParent: self)
        view.addSubview(settingsSwiftUIController.view)
        settingsSwiftUIController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            settingsSwiftUIController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            settingsSwiftUIController.view.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            settingsSwiftUIController.view.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            settingsSwiftUIController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
